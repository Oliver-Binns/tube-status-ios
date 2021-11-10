//
//  ComplicationController.swift
//  watchOS WatchKit Extension
//
//  Created by Oliver Binns on 07/07/2020.
//
import ClockKit
import UndergroundStatus
import TFLAPI

class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Complication Configuration

    func getComplicationDescriptors(handler: @escaping ([CLKComplicationDescriptor]) -> Void) {
        let descriptors = Line.allCases
            .map { $0.rawValue }
            .map {
                CLKComplicationDescriptor(identifier: $0,
                                          displayName: "\($0) Status", supportedFamilies: CLKComplicationFamily.allCases)
            }
        // Call the handler with the currently supported complication descriptors
        handler(descriptors)
    }
    
    func handleSharedComplicationDescriptors(_ complicationDescriptors: [CLKComplicationDescriptor]) {
        // Do any necessary work to support these newly shared complication descriptors
    }

    // MARK: - Timeline Configuration
    
    func getTimelineEndDate(for complication: CLKComplication,
                            withHandler handler: @escaping (Date?) -> Void) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication,
                            withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication,
                                 withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        guard let line = Line(rawValue: complication.identifier) else { handler(nil); return }
        StatusService().getStatus(for: line) { [weak self] statuses in
            guard let status = statuses.first,
                  let template = self?.getTemplateForLineStatusUpdate(status, matching: complication)
            else { handler(nil); return }
            handler(CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template))
        }
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int,
                            withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after the given date
        handler(nil)
    }

    // MARK: - Sample Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication,
                                      withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        handler(getTemplateForLineStatusUpdate(LineStatusUpdate(line: .bakerloo), matching: complication))
    }

    func getTemplateForLineStatusUpdate(_ update: LineStatusUpdate,
                                        matching complication: CLKComplication) -> CLKComplicationTemplate? {
        let header = CLKSimpleTextProvider(text: update.line.rawValue)
        let statusType = update.statuses.first?.type ?? .goodService
        let body = CLKSimpleTextProvider(text: statusType.rawValue)
        guard let image = UIImage(systemName: statusType.iconName)?
                .withTintColor(UIColor(update.line.color), renderingMode: .alwaysOriginal) else {
            return nil
        }
        let imageProvider = CLKImageProvider(onePieceImage: image)
        let fullColorImageProvider = CLKFullColorImageProvider(fullColorImage: image)

        let template: CLKComplicationTemplate?
        switch complication.family {
        case .modularSmall:
            template = CLKComplicationTemplateModularSmallStackImage(line1ImageProvider: imageProvider, line2TextProvider: header)
        case .modularLarge:
            template = CLKComplicationTemplateModularLargeStandardBody(headerTextProvider: header, body1TextProvider: body)
        case .utilitarianSmall:
            template = CLKComplicationTemplateUtilitarianSmallFlat(textProvider: body)
        case .utilitarianSmallFlat:
            template = CLKComplicationTemplateUtilitarianSmallFlat(textProvider: body)
        case .utilitarianLarge:
            template = CLKComplicationTemplateUtilitarianLargeFlat(textProvider: body, imageProvider: imageProvider)
        case .circularSmall:
            template = CLKComplicationTemplateCircularSmallStackText(line1TextProvider: header, line2TextProvider: body)
        case .extraLarge:
            template = CLKComplicationTemplateExtraLargeStackText(line1TextProvider: header, line2TextProvider: body)
        case .graphicCorner:
            template = CLKComplicationTemplateGraphicCornerTextImage(textProvider: body, imageProvider: fullColorImageProvider)
        case .graphicBezel:
            let circular = CLKComplicationTemplateGraphicCircularStackImage(line1ImageProvider: fullColorImageProvider, line2TextProvider: header)
            template = CLKComplicationTemplateGraphicBezelCircularText(circularTemplate: circular, textProvider: body)
        case .graphicCircular:
            template = CLKComplicationTemplateGraphicCircularStackImage(line1ImageProvider: fullColorImageProvider, line2TextProvider: header)
        case .graphicRectangular:
            template = CLKComplicationTemplateGraphicRectangularStandardBody(headerTextProvider: header, body1TextProvider: body)
        case .graphicExtraLarge:
            template = CLKComplicationTemplateGraphicExtraLargeCircularStackImage(line1ImageProvider: fullColorImageProvider, line2TextProvider: body)
        @unknown default:
            template = nil
        }
        template?.tintColor = UIColor(update.line.color)
        return template
    }
}
