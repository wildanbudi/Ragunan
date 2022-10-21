//
//  ViewController.swift
//  Ragunan-Zoo-Map
//
//  Created by Wildan Budi on 07/10/22.
//

import Combine
import UIKit
import MapboxDirections
import MapboxCoreNavigation
import MapboxNavigation
import CoreLocation

class ViewController: UIViewController {
    
//    var animals: [Animal] = [Animal(cage: "sample", idName: "sample", enName: "sample", latinName: "sample", image: "Assets"),
//    Animal(cage: "sample2", idName: "sample2", enName: "sample2", latinName: "sample2", image: "AssetsOverview")]

//    private let loginContentView:UIView = {
//    let view = UIView()
//    view.translatesAutoresizingMaskIntoConstraints = false
//    view.backgroundColor = .white
//    view.layer.cornerRadius = 20
//    return view
//    }()
//
//    private let unameTxtField:UITextField = {
//        let txtField = UITextField()
//        txtField.backgroundColor = .white
//        txtField.placeholder = "Username"
//        txtField.borderStyle = .roundedRect
//        txtField.translatesAutoresizingMaskIntoConstraints = false
//        txtField.addAction(UIAction { action in
//            let textField = action.sender as! UITextField
//            print("Text changed \(textField.text ?? "no value")")
//        }, for: .editingChanged)
//        return txtField
//    }()
//
//
//    private let btnLogin:UIButton = {
//    let btn = UIButton(type: .system)
//        btn.configuration = .filled()
//        btn.configuration?.title = "Login"
//    btn.translatesAutoresizingMaskIntoConstraints = false
//    btn.addAction(UIAction { action in
//    print("tapped")
//    }, for: .touchUpInside)
//    return btn
//    }()
//
//    private let pwordTxtField:UITextField = {
//        let txtField = UITextField()
//        txtField.placeholder = "Password"
//        txtField.borderStyle = .roundedRect
//        txtField.translatesAutoresizingMaskIntoConstraints = false
//        return txtField
//    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        for animal in animals {
//
//        }
//        let imageName = "Trenggiling"
//        let image = UIImage(named: imageName)
//        let imageView = UIImageView(image: image!)
//        imageView.frame = CGRect(x: 10, y: 100, width: 60, height: 60)
//        self.view.addSubview(imageView)
//
//        loginContentView.addSubview(unameTxtField)
//        loginContentView.addSubview(pwordTxtField)
//        loginContentView.addSubview(btnLogin)
//        self.view.addSubview(loginContentView)
//
//        setupAutoLayout()
//
//
        // Define two waypoints to travel between
        let origin = Waypoint(coordinate: CLLocationCoordinate2D(latitude: -6.307248, longitude: 106.82037), name: "Mapbox")
        let destination = Waypoint(coordinate: CLLocationCoordinate2D(latitude: -6.308459, longitude: 106.822004), name: "Kandang Ayam")

        // Set options
        let routeOptions = NavigationRouteOptions(waypoints: [origin, destination])

        // Request a route using MapboxDirections.swift
        Directions.shared.calculate(routeOptions) { [weak self] (_, result) in
                    switch result {
                    case .failure(let error):
                        print(error.localizedDescription)
                    case .success(let response):
                        guard let strongSelf = self else {
                            return
                        }

                        // For demonstration purposes, simulate locations if the Simulate Navigation option is on.
                        let navigationService = MapboxNavigationService(routeResponse: response,
                                                                        routeIndex: 0,
                                                                        routeOptions: routeOptions,
                                                                        customRoutingProvider: NavigationSettings.shared.directions,
                                                                        credentials: NavigationSettings.shared.directions.credentials)
                        let navigationOptions = NavigationOptions(styles: [CustomDayStyle(), CustomNightStyle()],
                                                                  navigationService: navigationService)
                        let navigationViewController = NavigationViewController(for: response,
                                                                                   routeIndex: 0,
                                                                                   routeOptions: routeOptions,
                                                                                   navigationOptions: navigationOptions)
                        navigationViewController.modalPresentationStyle = .fullScreen
                        // Render part of the route that has been traversed with full transparency, to give the illusion of a disappearing route.
                        navigationViewController.routeLineTracksTraversal = true

                        strongSelf.present(navigationViewController, animated: true, completion: nil)
                    }
        }
//    }

//    func setupAutoLayout() {
//
//            // Constraint for login white-rounded view
//            NSLayoutConstraint.activate([
//                loginContentView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 20),
//                loginContentView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
//                loginContentView.centerYAnchor.constraint(equalToSystemSpacingBelow: view.centerYAnchor, multiplier: 1),
//                loginContentView.heightAnchor.constraint(equalToConstant: view.bounds.size.height/3.3)
//            ])
//
//            // Constraint for username text field
//                    NSLayoutConstraint.activate([
//            unameTxtField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 30),
//            unameTxtField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -30),
//            unameTxtField.bottomAnchor.constraint(equalTo: pwordTxtField.topAnchor, constant: -30)
//                    ])
//
//            // Constraint for password text field
//                    NSLayoutConstraint.activate([
//            pwordTxtField.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 30),
//            pwordTxtField.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -30),
//            pwordTxtField.centerYAnchor.constraint(equalToSystemSpacingBelow: loginContentView.centerYAnchor, multiplier: 1)
//                    ])
//
//            // Constraint for login button
//                    NSLayoutConstraint.activate([
//            btnLogin.leftAnchor.constraint(equalTo: loginContentView.leftAnchor, constant: 30),
//            btnLogin.rightAnchor.constraint(equalTo: loginContentView.rightAnchor, constant: -30),
//            btnLogin.topAnchor.constraint(equalTo: pwordTxtField.bottomAnchor, constant: 20).isActive = true
//            btnLogin.heightAnchor.constraint(equalToConstant: 40)
//                    ])
        }
}

struct ViewControllerPreviews: PreviewProvider {
    static var previews: some View {
        UIViewControllerPreview {
            return ViewController()
        }
        .previewDevice("iPhone 12")
    }
}

import SwiftUI

@available(iOS 13, *)
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        viewController = builder()
    }

    func makeUIViewController(context: Context) -> ViewController { viewController }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
    
    
}

class CustomDayStyle: DayStyle {
    
    private let backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
    private let darkBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    private let secondaryBackgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    private let blueColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
    private let lightGrayColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
    private let darkGrayColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
    private let primaryLabelColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    private let secondaryLabelColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9)
    
    required init() {
        super.init()
//        mapStyleURL = URL(string: "mapbox://styles/mapbox/satellite-streets-v9")!
        styleType = .day
    }
    
    override func apply() {
        super.apply()
        
        let traitCollection = UIScreen.main.traitCollection
        ArrivalTimeLabel.appearance(for: traitCollection).textColor = lightGrayColor
        BottomBannerView.appearance(for: traitCollection).backgroundColor = secondaryBackgroundColor
        BottomPaddingView.appearance(for: traitCollection).backgroundColor = secondaryBackgroundColor
        Button.appearance(for: traitCollection).textColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        CancelButton.appearance(for: traitCollection).tintColor = lightGrayColor
        DistanceLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [InstructionsBannerView.self]).unitTextColor = secondaryLabelColor
        DistanceLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [InstructionsBannerView.self]).valueTextColor = primaryLabelColor
        DistanceLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [StepInstructionsView.self]).unitTextColor = lightGrayColor
        DistanceLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [StepInstructionsView.self]).valueTextColor = darkGrayColor
        DistanceRemainingLabel.appearance(for: traitCollection).textColor = lightGrayColor
        DismissButton.appearance(for: traitCollection).textColor = darkGrayColor
        FloatingButton.appearance(for: traitCollection).backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        FloatingButton.appearance(for: traitCollection).tintColor = blueColor
        TopBannerView.appearance(for: traitCollection).backgroundColor = backgroundColor
        InstructionsBannerView.appearance(for: traitCollection).backgroundColor = backgroundColor
        LanesView.appearance(for: traitCollection).backgroundColor = darkBackgroundColor
        LaneView.appearance(for: traitCollection).primaryColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        ManeuverView.appearance(for: traitCollection).backgroundColor = backgroundColor
        ManeuverView.appearance(for: traitCollection, whenContainedInInstancesOf: [InstructionsBannerView.self]).primaryColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        ManeuverView.appearance(for: traitCollection, whenContainedInInstancesOf: [InstructionsBannerView.self]).secondaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        ManeuverView.appearance(for: traitCollection, whenContainedInInstancesOf: [NextBannerView.self]).primaryColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        ManeuverView.appearance(for: traitCollection, whenContainedInInstancesOf: [NextBannerView.self]).secondaryColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)
        ManeuverView.appearance(for: traitCollection, whenContainedInInstancesOf: [StepInstructionsView.self]).primaryColor = darkGrayColor
        ManeuverView.appearance(for: traitCollection, whenContainedInInstancesOf: [StepInstructionsView.self]).secondaryColor = lightGrayColor
        NextBannerView.appearance(for: traitCollection).backgroundColor = backgroundColor
        NextInstructionLabel.appearance(for: traitCollection).textColor = #colorLiteral(red: 0.9842069745, green: 0.9843751788, blue: 0.9841964841, alpha: 1)
        NavigationMapView.appearance(for: traitCollection).tintColor = blueColor
        NavigationMapView.appearance(for: traitCollection).routeCasingColor = #colorLiteral(red: 0.1968861222, green: 0.4148176908, blue: 0.8596113324, alpha: 1)
        NavigationMapView.appearance(for: traitCollection).trafficHeavyColor = #colorLiteral(red: 0.9995597005, green: 0, blue: 0, alpha: 1)
        NavigationMapView.appearance(for: traitCollection).trafficLowColor = blueColor
        NavigationMapView.appearance(for: traitCollection).trafficModerateColor = #colorLiteral(red: 1, green: 0.6184511781, blue: 0, alpha: 1)
        NavigationMapView.appearance(for: traitCollection).trafficSevereColor = #colorLiteral(red: 0.7458544374, green: 0.0006075350102, blue: 0, alpha: 1)
        NavigationMapView.appearance(for: traitCollection).trafficUnknownColor = blueColor
        // Customize the color that appears on the traversed section of a route
        NavigationMapView.appearance(for: traitCollection).traversedRouteColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0.5)
        PrimaryLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [InstructionsBannerView.self]).normalTextColor = primaryLabelColor
        PrimaryLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [StepInstructionsView.self]).normalTextColor = darkGrayColor
        ResumeButton.appearance(for: traitCollection).backgroundColor = secondaryBackgroundColor
        ResumeButton.appearance(for: traitCollection).tintColor = blueColor
        SecondaryLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [InstructionsBannerView.self]).normalTextColor = secondaryLabelColor
        SecondaryLabel.appearance(for: traitCollection, whenContainedInInstancesOf: [StepInstructionsView.self]).normalTextColor = darkGrayColor
        TimeRemainingLabel.appearance(for: traitCollection).textColor = lightGrayColor
        TimeRemainingLabel.appearance(for: traitCollection).trafficLowColor = darkBackgroundColor
        TimeRemainingLabel.appearance(for: traitCollection).trafficUnknownColor = darkGrayColor
        WayNameLabel.appearance(for: traitCollection).normalTextColor = blueColor
        WayNameView.appearance(for: traitCollection).backgroundColor = secondaryBackgroundColor
    }
}

class CustomNightStyle: NightStyle {
    
    private let backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    private let darkBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
    private let secondaryBackgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
    private let blueColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    private let lightGrayColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
    private let darkGrayColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    private let primaryTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    private let secondaryTextColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.9)
    
    required init() {
        super.init()
//        mapStyleURL = URL(string: "mapbox://styles/mapbox/satellite-streets-v9")!
        styleType = .night
    }
    
    override func apply() {
        super.apply()
        
        let traitCollection = UIScreen.main.traitCollection
        DistanceRemainingLabel.appearance(for: traitCollection).normalTextColor = primaryTextColor
        BottomBannerView.appearance(for: traitCollection).backgroundColor = secondaryBackgroundColor
        BottomPaddingView.appearance(for: traitCollection).backgroundColor = secondaryBackgroundColor
        FloatingButton.appearance(for: traitCollection).backgroundColor = #colorLiteral(red: 0.1434620917, green: 0.1434366405, blue: 0.1819391251, alpha: 0.9037466989)
        TimeRemainingLabel.appearance(for: traitCollection).textColor = primaryTextColor
        TimeRemainingLabel.appearance(for: traitCollection).trafficLowColor = primaryTextColor
        TimeRemainingLabel.appearance(for: traitCollection).trafficUnknownColor = primaryTextColor
        ResumeButton.appearance(for: traitCollection).backgroundColor = #colorLiteral(red: 0.1434620917, green: 0.1434366405, blue: 0.1819391251, alpha: 0.9037466989)
        ResumeButton.appearance(for: traitCollection).tintColor = blueColor
    }
}
