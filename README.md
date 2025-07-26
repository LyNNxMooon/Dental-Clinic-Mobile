<div id="top">

<!-- HEADER STYLE: CLASSIC -->
<div align="left">


# DENTAL-CLINIC-MOBILE

<em>Transforming Dental Care, One Smile at a Time</em>

<!-- BADGES -->
<img src="https://img.shields.io/github/last-commit/LyNNxMooon/Dental-Clinic-Mobile?style=flat&logo=git&logoColor=white&color=0080ff" alt="last-commit">
<img src="https://img.shields.io/github/languages/top/LyNNxMooon/Dental-Clinic-Mobile?style=flat&color=0080ff" alt="repo-top-language">
<img src="https://img.shields.io/github/languages/count/LyNNxMooon/Dental-Clinic-Mobile?style=flat&color=0080ff" alt="repo-language-count">

<em>Built with the tools and technologies:</em>

<img src="https://img.shields.io/badge/JSON-000000.svg?style=flat&logo=JSON&logoColor=white" alt="JSON">
<img src="https://img.shields.io/badge/Markdown-000000.svg?style=flat&logo=Markdown&logoColor=white" alt="Markdown">
<img src="https://img.shields.io/badge/Swift-F05138.svg?style=flat&logo=Swift&logoColor=white" alt="Swift">
<img src="https://img.shields.io/badge/Android-34A853.svg?style=flat&logo=Android&logoColor=white" alt="Android">
<img src="https://img.shields.io/badge/Gradle-02303A.svg?style=flat&logo=Gradle&logoColor=white" alt="Gradle">
<img src="https://img.shields.io/badge/Dart-0175C2.svg?style=flat&logo=Dart&logoColor=white" alt="Dart">
<br>
<img src="https://img.shields.io/badge/C++-00599C.svg?style=flat&logo=C++&logoColor=white" alt="C++">
<img src="https://img.shields.io/badge/XML-005FAD.svg?style=flat&logo=XML&logoColor=white" alt="XML">
<img src="https://img.shields.io/badge/Flutter-02569B.svg?style=flat&logo=Flutter&logoColor=white" alt="Flutter">
<img src="https://img.shields.io/badge/CMake-064F8C.svg?style=flat&logo=CMake&logoColor=white" alt="CMake">
<img src="https://img.shields.io/badge/Kotlin-7F52FF.svg?style=flat&logo=Kotlin&logoColor=white" alt="Kotlin">
<img src="https://img.shields.io/badge/YAML-CB171E.svg?style=flat&logo=YAML&logoColor=white" alt="YAML">

</div>
<br>

---

## Table of Contents

- [Overview](#overview)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Usage](#usage)
    - [Testing](#testing)
- [Features](#features)
- [Project Structure](#project-structure)
    - [Project Index](#project-index)

---

## Overview

Dental-Clinic-Mobile is a robust Flutter-based application designed to streamline dental clinic operations across multiple platforms. It integrates Firebase services for authentication, real-time data, and messaging, ensuring seamless communication and data management. The app features a modular widget architecture for consistent UI/UX, local storage with Hive for offline access, and comprehensive controllers to handle backend interactions efficiently.

**Why Dental-Clinic-Mobile?**

This project simplifies complex healthcare workflows by providing:

- 🎯 **🔧 Customizable UI Components:** Reusable widgets for rapid development and consistent design.
- 🚀 **Firebase Integration:** Secure authentication, real-time database, and cloud messaging.
- 🌐 **Cross-Platform Compatibility:** Supports Android, iOS, Web, and Desktop from a single codebase.
- 💬 **Real-Time Communication:** Built-in chat and notification systems to enhance user engagement.
- 🔒 **Secure Data Handling:** Local storage with Hive for offline access and data persistence.

---

## Features

|      | Component            | Details                                                                                     |
| :--- | :------------------- | :------------------------------------------------------------------------------------------ |
| ⚙️  | **Architecture**     | <ul><li>Flutter-based mobile app targeting both Android and iOS</li><li>Uses a layered architecture separating UI, business logic, and data layers</li></ul> |
| 🔩 | **Code Quality**     | <ul><li>Adheres to Dart best practices with organized folder structure</li><li>Uses analysis_options.yaml for static analysis rules</li></ul> |
| 📄 | **Documentation**    | <ul><li>Basic README with project overview</li><li>Includes inline code comments and some doc comments for classes</li></ul> |
| 🔌 | **Integrations**     | <ul><li>Firebase services (authentication, Firestore, cloud functions)</li><li>Google services via google-services.json</li><li>Uses pubspec.yaml for package dependencies</li></ul> |
| 🧩 | **Modularity**       | <ul><li>Features organized into separate Dart files and folders</li><li>Uses Flutter plugins for modular functionality</li></ul> |
| 🧪 | **Testing**          | <ul><li>Limited test coverage; includes some unit tests in test/ directory</li><li>Uses Flutter test framework</li></ul> |
| ⚡️  | **Performance**      | <ul><li>Optimized widget tree rendering</li><li>Uses const constructors where possible</li></ul> |
| 🛡️ | **Security**         | <ul><li>Firebase security rules for backend data access</li><li>Uses secure storage for sensitive info</li></ul> |
| 📦 | **Dependencies**     | <ul><li>Relies on core Flutter SDK, Firebase plugins, and other pub packages</li><li>Dependencies managed via pubspec.yaml and pubspec.lock</li></ul> |

---

## Project Structure

```sh
└── Dental-Clinic-Mobile/
    ├── README.md
    ├── analysis_options.yaml
    ├── android
    │   ├── .gitignore
    │   ├── app
    │   ├── build.gradle
    │   ├── gradle
    │   ├── gradle.properties
    │   └── settings.gradle
    ├── assets
    │   ├── animations
    │   ├── fonts
    │   └── images
    ├── firebase.json
    ├── ios
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── lib
    │   ├── constants
    │   ├── controller
    │   ├── data
    │   ├── firebase
    │   ├── firebase_options.dart
    │   ├── main.dart
    │   ├── persistent
    │   ├── screens
    │   ├── service
    │   ├── utils
    │   └── widgets
    ├── linux
    │   ├── .gitignore
    │   ├── CMakeLists.txt
    │   ├── flutter
    │   └── runner
    ├── macos
    │   ├── .gitignore
    │   ├── Flutter
    │   ├── Runner
    │   ├── Runner.xcodeproj
    │   ├── Runner.xcworkspace
    │   └── RunnerTests
    ├── pubspec.lock
    ├── pubspec.yaml
    ├── test
    │   └── widget_test.dart
    ├── web
    │   ├── favicon.png
    │   ├── icons
    │   ├── index.html
    │   └── manifest.json
    └── windows
        ├── .gitignore
        ├── CMakeLists.txt
        ├── flutter
        └── runner
```

---

### Project Index

<details open>
	<summary><b><code>DENTAL-CLINIC-MOBILE/</code></b></summary>
	<!-- __root__ Submodule -->
	<details>
		<summary><b>__root__</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ __root__</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/pubspec.yaml'>pubspec.yaml</a></b></td>
					<td style='padding: 8px;'>- Defines the core configuration for the dental_clinic_mobile Flutter application, establishing project metadata, dependencies, assets, and environment settings<br>- It orchestrates the integration of essential packages such as Firebase, state management, UI components, and local storage, enabling seamless development and deployment of a feature-rich mobile app tailored for dental clinic management.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/analysis_options.yaml'>analysis_options.yaml</a></b></td>
					<td style='padding: 8px;'>Defines static analysis rules and linting configurations to enforce code quality and best practices across the Dart and Flutter codebase, ensuring maintainability and consistency throughout the project.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/firebase.json'>firebase.json</a></b></td>
					<td style='padding: 8px;'>- Defines Firebase configuration settings for the Flutter project, enabling seamless integration with Firebase services across Android and iOS platforms<br>- Facilitates authentication, data storage, and cloud functions by providing essential project identifiers and configuration details, ensuring consistent backend connectivity within the overall app architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/README.md'>README.md</a></b></td>
					<td style='padding: 8px;'>- Establishes the foundational structure for a Flutter-based mobile application tailored for a dental clinic<br>- It provides the essential setup and resources to facilitate the development of a user-friendly app that supports appointment management, patient interactions, and clinic operations, serving as the core entry point for building and expanding the mobile solution within the overall project architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- test Submodule -->
	<details>
		<summary><b>test</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ test</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/test/widget_test.dart'>widget_test.dart</a></b></td>
					<td style='padding: 8px;'>- Provides a fundamental widget test verifying core app functionality by simulating user interactions and ensuring the counter feature behaves correctly<br>- It supports the overall testing strategy within the Flutter project, ensuring UI components respond as expected and maintaining app stability during development<br>- This test helps validate the integrity of the user interface in the broader mobile application architecture.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- ios Submodule -->
	<details>
		<summary><b>ios</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ ios</b></code>
			<!-- Runner.xcodeproj Submodule -->
			<details>
				<summary><b>Runner.xcodeproj</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner.xcodeproj</b></code>
					<!-- project.xcworkspace Submodule -->
					<details>
						<summary><b>project.xcworkspace</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.xcodeproj.project.xcworkspace</b></code>
							<!-- xcshareddata Submodule -->
							<details>
								<summary><b>xcshareddata</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.xcodeproj.project.xcworkspace.xcshareddata</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
											<td style='padding: 8px;'>- Configure workspace settings to disable preview features within the iOS project environment, ensuring a streamlined development experience<br>- This setting aligns with the overall architecture by optimizing workspace behavior and maintaining consistency across team workflows, supporting efficient project management and collaboration in the Flutter-based mobile application.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- Runner.xcworkspace Submodule -->
			<details>
				<summary><b>Runner.xcworkspace</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner.xcworkspace</b></code>
					<!-- xcshareddata Submodule -->
					<details>
						<summary><b>xcshareddata</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.xcworkspace.xcshareddata</b></code>
							<table style='width: 100%; border-collapse: collapse;'>
							<thead>
								<tr style='background-color: #f8f9fa;'>
									<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
									<th style='text-align: left; padding: 8px;'>Summary</th>
								</tr>
							</thead>
								<tr style='border-bottom: 1px solid #eee;'>
									<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/Runner.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings'>WorkspaceSettings.xcsettings</a></b></td>
									<td style='padding: 8px;'>- Configures workspace settings to disable live previews within the iOS development environment, ensuring a streamlined and distraction-free workflow during app development and testing<br>- This setting helps maintain focus on core development tasks by preventing automatic preview updates, aligning with the overall architectures goal of optimizing the developer experience in the Flutter-based iOS project.</td>
								</tr>
							</table>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- Runner Submodule -->
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.Runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
							<td style='padding: 8px;'>- Facilitates the integration of Flutter with iOS by initializing the apps core application lifecycle and registering necessary plugins<br>- Ensures seamless startup and plugin setup within the iOS environment, serving as the primary entry point for app launch processes and bridging Flutters framework with native iOS functionalities.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/Runner/Runner-Bridging-Header.h'>Runner-Bridging-Header.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates seamless integration between Flutter and native iOS components by bridging generated plugin registrations<br>- Ensures that all Flutter plugins are properly linked within the iOS runtime environment, supporting smooth communication and functionality across the app’s architecture<br>- This setup is essential for maintaining consistent plugin behavior and stability within the overall Flutter-based iOS application.</td>
						</tr>
					</table>
					<!-- Assets.xcassets Submodule -->
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ ios.Runner.Assets.xcassets</b></code>
							<!-- AppIcon.appiconset Submodule -->
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.Assets.xcassets.AppIcon.appiconset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the app icon assets for iOS devices, specifying various image sizes and scales to ensure consistent branding across iPhone, iPad, and marketing platforms<br>- Supports the overall app architecture by providing the visual identifiers required for app store presentation and device display, contributing to a cohesive user experience and brand recognition within the iOS ecosystem.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- LaunchImage.imageset Submodule -->
							<details>
								<summary><b>LaunchImage.imageset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ ios.Runner.Assets.xcassets.LaunchImage.imageset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the launch screen assets for the iOS application, ensuring a consistent and visually appealing startup experience across all device sizes and resolutions<br>- It integrates multiple image scales to optimize display quality, contributing to the overall user interface architecture by providing a seamless initial impression during app launch.</td>
										</tr>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/Runner/Assets.xcassets/LaunchImage.imageset/README.md'>README.md</a></b></td>
											<td style='padding: 8px;'>- Defines customizable launch screen assets for the iOS application, enabling visual branding and user experience personalization during app startup<br>- Facilitates easy replacement of launch images through Xcode or direct asset management, ensuring the launch screen aligns with the overall app design and branding guidelines within the project architecture.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- RunnerTests Submodule -->
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ ios.RunnerTests</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/ios/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
							<td style='padding: 8px;'>- Provides a foundational testing scaffold for the iOS Runner application within the Flutter project<br>- It facilitates the addition of unit tests to ensure the stability and correctness of the apps iOS-specific components, supporting overall code quality and reliability in the broader Flutter architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- lib Submodule -->
	<details>
		<summary><b>lib</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ lib</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/main.dart'>main.dart</a></b></td>
					<td style='padding: 8px;'>- Initializes core application services, including Firebase, Hive local storage, and push notification handling, while setting up the apps theme and navigation structure<br>- Serves as the entry point that orchestrates essential startup routines, ensuring the app is ready for user interaction and maintains seamless integration with backend and local data layers within the overall architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/firebase_options.dart'>firebase_options.dart</a></b></td>
					<td style='padding: 8px;'>- Defines platform-specific Firebase configuration options to facilitate seamless initialization across Android and iOS within the Flutter application<br>- Serves as a centralized source for Firebase credentials, ensuring consistent connectivity to Firebase services such as authentication, database, and storage, thereby supporting the app’s backend integration and cross-platform functionality.</td>
				</tr>
			</table>
			<!-- persistent Submodule -->
			<details>
				<summary><b>persistent</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.persistent</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/persistent/hive_constant.dart'>hive_constant.dart</a></b></td>
							<td style='padding: 8px;'>- Defines constants for persistent storage keys and box identifiers related to user password management within the Hive database<br>- These constants facilitate consistent access and organization of user password data across the applications architecture, ensuring reliable data retrieval and storage in the context of user authentication workflows.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/persistent/hive_dao.dart'>hive_dao.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a centralized interface for securely storing and retrieving user passwords within the applications persistent storage layer<br>- It leverages Hive for efficient local data management, ensuring user credentials are easily accessible and maintained across sessions, thereby supporting authentication workflows and enhancing user experience within the overall architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- service Submodule -->
			<details>
				<summary><b>service</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.service</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/service/notification_scheduler.dart'>notification_scheduler.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a centralized mechanism for scheduling and displaying local notifications within the application, integrating platform-specific configurations for Android and iOS<br>- Facilitates user engagement by delivering timely alerts, manages notification initialization, and handles user interactions, thereby supporting the app’s overall communication and user experience strategy.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/service/fcm_service.dart'>fcm_service.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates integration of Firebase Cloud Messaging within the app, enabling real-time push notifications across foreground, background, and terminated states<br>- Manages device token registration, handles incoming messages, and triggers user notifications, ensuring seamless communication and engagement with users as part of the overall notification and user interaction architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- constants Submodule -->
			<details>
				<summary><b>constants</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.constants</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/constants/images.dart'>images.dart</a></b></td>
							<td style='padding: 8px;'>- Defines a constant placeholder image URL used across the application to ensure a consistent visual fallback for user profile images or other media<br>- It supports the overall architecture by maintaining uniformity in image handling and enhancing user experience when specific images are unavailable or loading<br>- This centralization simplifies updates and promotes design consistency throughout the project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/constants/text.dart'>text.dart</a></b></td>
							<td style='padding: 8px;'>- Defines consistent text styles for the applications user interface, ensuring visual uniformity across various screens<br>- By centralizing font styles such as titles and subtitles, it supports maintainability and cohesive branding within the overall mobile app architecture<br>- This setup enhances user experience through clear, styled textual elements aligned with the app’s color scheme.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/constants/colors.dart'>colors.dart</a></b></td>
							<td style='padding: 8px;'>- Define a consistent color palette to ensure visual coherence across the application<br>- The color constants facilitate uniform styling for UI elements, including primary, secondary, error, success, and message bubbles, supporting an intuitive and accessible user experience within the overall app architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- firebase Submodule -->
			<details>
				<summary><b>firebase</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.firebase</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/firebase/firebase.dart'>firebase.dart</a></b></td>
							<td style='padding: 8px;'>- Provides comprehensive Firebase integration for user authentication, real-time database management, file storage, and chat functionalities within the dental clinic mobile app<br>- Facilitates user sign-in/sign-up, manages patient, doctor, appointment, treatment, order, and feedback data, and supports secure messaging and chat features, ensuring seamless communication and data synchronization across the platform.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- widgets Submodule -->
			<details>
				<summary><b>widgets</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.widgets</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/error_widget.dart'>error_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable error dialog component for the Flutter-based dental clinic mobile app, enabling consistent and user-friendly display of error messages<br>- It enhances the applications robustness by offering a standardized way to inform users of issues and prompt corrective actions, thereby improving overall user experience and error handling within the app’s widget architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/loading_state_widget.dart'>loading_state_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable widget to manage and display different UI states during asynchronous operations, such as loading, success, or error<br>- It streamlines user experience by dynamically rendering appropriate visual feedback based on the current loading state, ensuring consistent and clear communication of process status within the apps overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/confirmation_widget.dart'>confirmation_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable confirmation dialog component within the mobile app, facilitating user acknowledgment for critical actions<br>- It displays an error icon, a customizable message, and options to cancel or confirm, ensuring consistent user experience across the application<br>- This widget integrates seamlessly into the overall architecture, supporting user interaction flows and decision points.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/banned_user_info.dart'>banned_user_info.dart</a></b></td>
							<td style='padding: 8px;'>- Displays a user interface informing banned users of their restriction status, including the reason provided by the admin<br>- Integrates with authentication logic to dynamically show ban details and offers a logout option<br>- Serves as a dedicated widget within the app’s architecture to handle user access restrictions and communicate enforcement actions effectively.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/search_item_tile.dart'>search_item_tile.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable widget for displaying individual search results of healthcare professionals, combining profile images, names, and specialties within a styled, scrollable layout<br>- Integrates seamlessly into the app’s search interface, enhancing user experience by presenting concise, visually appealing provider information in the broader architecture of the mobile dental clinic platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/password_permission_widget.dart'>password_permission_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Implements a password verification dialog within the applications security framework, enabling users to authenticate before executing sensitive actions<br>- It integrates with persistent storage to validate credentials and provides user feedback for incorrect entries, ensuring secure access control across the apps features<br>- This widget plays a crucial role in maintaining user data privacy and operational integrity.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/load_fail_widget.dart'>load_fail_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable widget to display a user-friendly message when data fails to load, prompting users to retry<br>- Integrates seamlessly within the apps architecture to enhance error handling and user experience across various screens, maintaining visual consistency and facilitating quick recovery from data retrieval issues.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/textfield.dart'>textfield.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a customizable text input widget for user forms, supporting validation for email and phone formats<br>- Integrates seamlessly into the app’s form architecture, ensuring consistent styling and validation logic across various input fields within the dental clinic mobile application<br>- Enhances user experience by simplifying form creation and maintaining input integrity throughout the codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/success_widget.dart'>success_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable success notification widget within the Flutter application, displaying a confirmation icon and message to inform users of successful actions<br>- Integrates seamlessly into the app’s UI, enhancing user experience by offering consistent visual feedback for positive outcomes across various workflows.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/profile_image_widget.dart'>profile_image_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable widget for displaying user profile images with rounded borders, leveraging cached network images for efficient loading and error handling<br>- Integrates seamlessly into the overall UI by ensuring consistent styling and fallback visuals, enhancing user experience across the application’s profile-related features within the mobile dental clinic platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/button_widget.dart'>button_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Defines a reusable custom button widget for the mobile app, enabling consistent styling and interaction across the user interface<br>- It streamlines user engagement by providing a visually cohesive and easily configurable component, supporting the overall architectures goal of modular, maintainable, and user-friendly UI elements within the dental clinic application.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/loading_widget.dart'>loading_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a reusable loading indicator component that visually communicates ongoing processes within the mobile application<br>- Integrates a customizable animated spinner aligned with the app’s color scheme, enhancing user experience during data fetching or processing states across various screens in the project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/widgets/admin_access_info_widget.dart'>admin_access_info_widget.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a user interface component that communicates restricted access for administrators within the dental clinic mobile application<br>- It ensures consistent messaging across the app by displaying a clear, styled notification when admin privileges do not permit feature access, supporting the overall architectures focus on role-based access control and user experience clarity.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- utils Submodule -->
			<details>
				<summary><b>utils</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.utils</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/utils/enums.dart'>enums.dart</a></b></td>
							<td style='padding: 8px;'>- Defines core enumerations for managing application states and validation types, facilitating consistent handling of loading processes and input validation across the codebase<br>- The LoadingState enum standardizes UI feedback during asynchronous operations, while the Validator enum categorizes validation logic for email and phone inputs, supporting reliable user data validation within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/utils/file_picker_utils.dart'>file_picker_utils.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates image selection within the application by providing streamlined access to camera or gallery sources<br>- Integrates with the overall architecture to enable users to easily capture or choose images, supporting features that require media input<br>- Enhances user experience by abstracting device-specific image picking processes, ensuring consistent functionality across different platforms.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- screens Submodule -->
			<details>
				<summary><b>screens</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.screens</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/access_denied_screen.dart'>access_denied_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a user interface for access denial within the application, guiding users to re-authenticate when permissions are insufficient<br>- Integrates seamlessly into the overall architecture by handling authorization failures and redirecting users to the authentication flow, ensuring secure access control and a consistent user experience across the mobile platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/profile_screen.dart'>profile_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a user profile interface within the mobile app, enabling users to view and update personal information, change passwords, and manage account deletion<br>- Integrates authentication and appointment data to ensure secure actions, while handling user states such as bans or active appointments<br>- Serves as a central component for user account management, enhancing user experience and security.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/login_screen.dart'>login_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user authentication within the dental clinic mobile app by providing a responsive login interface<br>- Manages user input, handles password visibility toggling, and integrates with the authentication controller to initiate login and password reset processes<br>- Serves as a critical entry point, enabling secure access and guiding users toward account creation.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/search_pharmacy_screen.dart'>search_pharmacy_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Implements a search interface for pharmacies, enabling users to filter and browse pharmacy listings dynamically<br>- Integrates search functionality with real-time filtering, displays pharmacy details including images, prices, and stock status, and allows adding items to the cart<br>- Serves as a key component for user interaction within the app’s pharmacy browsing and purchasing flow.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/doctor_info_screen.dart'>doctor_info_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides the user interface for displaying and searching available doctors within the mobile application<br>- Facilitates navigation to detailed doctor profiles and integrates dynamic data loading, ensuring users can easily browse, search, and access comprehensive information about medical professionals in a seamless, visually organized manner.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/navigation_screen.dart'>navigation_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a navigation framework for the mobile app, enabling seamless switching between core screens such as doctor info, appointments, treatments, emergency services, contact, and profile<br>- Integrates a curved bottom navigation bar with dynamic data fetching and state management, ensuring relevant controllers are invoked based on user interactions, thereby supporting the app’s overall architecture of modular, user-centric healthcare functionalities.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/treatment_detail_screen.dart'>treatment_detail_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a detailed interface for viewing and updating treatment details within the dental clinic app<br>- Facilitates displaying treatment information, medical data, payment status, and associated images, while enabling users to select and modify payment methods and submit updates<br>- Integrates with controllers to manage state and handle treatment modifications, supporting seamless treatment management workflows.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/pharmacy_screen.dart'>pharmacy_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a comprehensive interface for browsing, searching, and managing pharmacy products within a mobile application<br>- Facilitates real-time cart updates, displays pharmacy details, and enables order placement, integrating user interactions with backend data through state management<br>- Serves as the central screen for pharmacy-related activities, ensuring seamless user experience in purchasing medicines.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/register_screen.dart'>register_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user registration within the dental clinic mobile app by capturing personal details, profile image, and gender selection<br>- Integrates form validation, password visibility toggling, and loading states to ensure a smooth onboarding experience<br>- Serves as the primary interface for new users to create accounts, linking user input to backend registration processes within the apps architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/appointment_screen.dart'>appointment_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides the user interface for viewing, managing, and adding appointments within the dental clinic mobile app<br>- It displays appointment details, handles user access levels, and integrates with controllers to fetch and filter appointment data based on selected dates<br>- Facilitates seamless appointment scheduling and status tracking, supporting both administrative and patient workflows in the overall application architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/auth_page.dart'>auth_page.dart</a></b></td>
							<td style='padding: 8px;'>- Manages user authentication state by monitoring Firebase authentication changes and directing users to either the main navigation interface or login/register options accordingly<br>- Serves as the entry point for user session handling within the app, ensuring seamless transition between authenticated and unauthenticated states, and integrating core navigation flow based on authentication status.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/place_order_screen.dart'>place_order_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates the placement of customer orders by displaying total price, available payment options, and order confirmation controls<br>- Integrates payment selection, image upload for non-cash methods, and order submission within a user-friendly interface, supporting seamless transaction processing and enhancing the overall checkout experience in the mobile dental clinic application.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/change_password_page.dart'>change_password_page.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user password updates within the application by providing an intuitive interface for entering current and new passwords<br>- Integrates with authentication logic to handle password change requests, ensuring secure and seamless account management<br>- Serves as a critical component in the user account settings architecture, promoting security and user autonomy.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/emergency_detail_screen.dart'>emergency_detail_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Displays detailed information about a specific emergency saving, including visual representation, title, and methods<br>- Integrates user profile imagery and provides a clear, user-friendly interface for viewing emergency saving data within the app’s architecture<br>- Facilitates seamless navigation and enhances user engagement with emergency-related content.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/contact_screen.dart'>contact_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user interactions with contact options, including accessing pharmacy services, submitting feedback, and initiating chats<br>- Displays patient feedback summaries and manages navigation to detailed views, supporting communication and engagement within the dental clinic mobile app<br>- Enhances user experience by integrating feedback display, chat notifications, and access controls based on user status.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/treatment_screen.dart'>treatment_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides the user interface for viewing and selecting dental treatments by date, displaying treatment details in a grid layout<br>- Manages user access levels, handles loading states, and navigates to detailed treatment screens, integrating with controllers for data retrieval and state management within the overall app architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/order_screen.dart'>order_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a comprehensive interface for viewing, filtering, and managing customer orders within the mobile application<br>- Facilitates date-based order selection, displays detailed order information, including status, items, and payment details, and enables order status updates, especially for delivered orders<br>- Integrates with the order controller to handle data fetching, state management, and order modifications, ensuring a seamless order management experience.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/search_doctor_screen.dart'>search_doctor_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user-driven search functionality for doctors within the mobile app, enabling real-time filtering and navigation to detailed profiles<br>- Integrates with the overall architecture by leveraging state management to dynamically update search results, ensuring a seamless and responsive user experience in locating healthcare providers.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/chat_screen.dart'>chat_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates real-time communication between users and administrators within the app, enabling message exchange, image sharing, and message display<br>- Manages message retrieval, ordering, and presentation, ensuring a seamless chat experience<br>- Supports sending text and photo messages, with visual differentiation based on sender, contributing to the overall messaging architecture of the platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/add_appointment_screen.dart'>add_appointment_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates the addition of new appointments by enabling users to select dates, times, and available doctors based on real-time availability<br>- Integrates user interface components with backend controllers to manage appointment scheduling, doctor selection, and availability checks, ensuring a seamless and interactive experience within the overall healthcare management architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/splash_screen.dart'>splash_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides an animated splash screen that introduces the Dental Clinic app with engaging visuals and branding<br>- It serves as the initial interface, displaying a logo animation and app name before seamlessly transitioning to the authentication page, thereby enhancing user experience and establishing brand identity during app startup.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/login_register_toggle_screen.dart'>login_register_toggle_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates seamless navigation between login and registration interfaces within the mobile application<br>- Acts as a toggle mechanism, allowing users to switch effortlessly between authentication screens, thereby enhancing user experience and streamlining access to account-related functionalities in the overall app architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/emergency_saving_screen.dart'>emergency_saving_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides the user interface for displaying a grid of emergency savings options, integrating state management and asynchronous data loading<br>- Facilitates navigation to detailed views of individual savings, utilizing visual components like images and cards to enhance user engagement within the overall mobile app architecture<br>- Ensures a responsive, interactive experience aligned with the app’s emergency savings feature.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/profile_update_screen.dart'>profile_update_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user profile updates within the mobile application by providing an intuitive interface for editing personal details, profile picture, and medical information<br>- Integrates with authentication and state management controllers to ensure seamless data retrieval and submission, supporting a smooth user experience for maintaining accurate profile information in the overall app architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/doctor_detail_screen.dart'>doctor_detail_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Provides a detailed view of a selected doctor’s profile, including personal information, biography, specialization, experience, and availability<br>- Integrates visual elements and structured data presentation to enhance user understanding and facilitate appointment scheduling within the broader healthcare application architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/add_feedback_screen.dart'>add_feedback_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user feedback submission by providing an intuitive interface for entering comments and selecting star ratings<br>- Integrates with the feedback controller to handle data processing and state management, supporting the overall architectures goal of capturing user insights efficiently<br>- Enhances user engagement and feedback collection within the mobile applications feedback module.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/screens/feed_back_detail_screen.dart'>feed_back_detail_screen.dart</a></b></td>
							<td style='padding: 8px;'>- Displays detailed feedback information, including rating, patient name, and comments, within the mobile app<br>- Integrates seamlessly into the overall architecture by providing a dedicated view for user feedback, enhancing user experience and data transparency<br>- Serves as a crucial component for reviewing and managing patient feedback in the feedback management workflow.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- controller Submodule -->
			<details>
				<summary><b>controller</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ lib.controller</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/register_controller.dart'>register_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates user registration by managing profile image selection, validating input data, and orchestrating account creation with Firebase Authentication<br>- Integrates local storage for user data persistence and handles error states to ensure a smooth onboarding process within the mobile application architecture<br>- Serves as a core component for onboarding workflows, linking user input, media handling, and backend services seamlessly.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/base_controller.dart'>base_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Establishes a foundational controller managing loading states and error messages across the application, facilitating consistent state handling within the overall architecture<br>- Serves as a base class for other controllers, promoting code reuse and streamlined state management in the mobile dental clinic app<br>- Enhances maintainability by centralizing common control logic.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/auth_controller.dart'>auth_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Provides comprehensive user authentication and profile management within the mobile application<br>- Handles login, password updates, profile editing, and account deletion, integrating Firebase Authentication and Firestore<br>- Manages user state, retrieves user data, and facilitates image uploads, ensuring secure and seamless user interactions aligned with the app’s overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/order_controller.dart'>order_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages patient order data within the dental clinic mobile app by fetching, filtering, and updating orders through Firebase integration<br>- Facilitates date-based order viewing, real-time synchronization, and order status modifications, ensuring seamless order management and user notifications across the application’s architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/doctor_controller.dart'>doctor_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages and provides access to the list of doctors within the application, facilitating real-time data synchronization with Firebase<br>- Handles fetching, searching, and updating doctor information, supporting seamless integration of doctor data into the overall system architecture for efficient retrieval and display.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/payment_controller.dart'>payment_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages payment data retrieval and synchronization within the application, integrating real-time updates from Firebase<br>- Facilitates seamless display and state management of payment information, supporting the overall architecture by ensuring accurate, up-to-date payment records are accessible for user interactions and backend processes.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/appointment_controller.dart'>appointment_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages appointment data flow within the dental clinic mobile app, including fetching, filtering, and updating appointment records<br>- Facilitates appointment creation, date selection, and real-time synchronization with Firebase, ensuring users can view and manage their appointments seamlessly<br>- Acts as the central controller for appointment-related operations, integrating user authentication and backend services to maintain data consistency.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/emergency_saving_controller.dart'>emergency_saving_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages and retrieves emergency savings data within the application, integrating real-time updates from Firebase<br>- Facilitates seamless synchronization of emergency saving information, ensuring the user interface reflects current data states and handles loading and error conditions effectively, thereby supporting the overall architectures focus on real-time data consistency and user experience.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/pharmacy_controller.dart'>pharmacy_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages pharmacy-related operations within the mobile application, including fetching pharmacy data, handling cart items, processing orders, and managing payment workflows<br>- Facilitates user interactions for selecting pharmacies, uploading payment slips, and confirming orders, ensuring seamless integration between user actions, Firebase backend, and local state management to support the overall e-commerce architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/treatment_controller.dart'>treatment_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages treatment data within the mobile dental clinic app by fetching, filtering, and updating treatment records, including handling file uploads and payment details<br>- Facilitates user interactions for selecting treatment dates, uploading treatment slips, and updating treatment information, ensuring seamless synchronization with Firebase backend services<br>- Supports real-time treatment management and enhances user experience through dialogs and state handling.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/chat_controller.dart'>chat_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Facilitates real-time chat interactions within the application by managing message exchange, user conversations, and media uploads through Firebase integration<br>- Coordinates retrieval of chat lists, sending text and photo messages, and streaming message data, thereby enabling seamless communication between users in the overall system architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/lib/controller/feedback_controller.dart'>feedback_controller.dart</a></b></td>
							<td style='padding: 8px;'>- Manages user feedback interactions within the application, including retrieving real-time feedback data from Firebase and facilitating the addition of new feedback entries<br>- Integrates authentication details to associate feedback with users and handles validation, error reporting, and success notifications, thereby supporting the overall user experience and feedback collection architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- web Submodule -->
	<details>
		<summary><b>web</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ web</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/web/manifest.json'>manifest.json</a></b></td>
					<td style='padding: 8px;'>- Defines the web applications metadata and icons to ensure proper installation, appearance, and branding across devices<br>- It facilitates a seamless user experience by specifying the apps name, theme, background, and visual assets, supporting the overall architecture of the Flutter-based mobile project<br>- This configuration enables the app to function as a standalone, installable experience on user devices.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/web/index.html'>index.html</a></b></td>
					<td style='padding: 8px;'>- Defines the entry point for a Flutter web application, setting up essential HTML structure, metadata, and resource links to ensure proper app initialization, branding, and responsiveness across devices<br>- It facilitates seamless integration of the Flutter app within various hosting environments by dynamically adjusting the base URL and loading necessary scripts for app bootstrap.</td>
				</tr>
			</table>
		</blockquote>
	</details>
	<!-- windows Submodule -->
	<details>
		<summary><b>windows</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ windows</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					<td style='padding: 8px;'>- Defines the build configuration and setup for the Windows version of the dental_clinic_mobile application, integrating Flutter components, managing plugin compilation, and orchestrating installation procedures<br>- Ensures consistent build modes, optimizes compilation settings, and facilitates deployment of runtime assets and native libraries, supporting a seamless development and distribution process within the overall project architecture.</td>
				</tr>
			</table>
			<!-- runner Submodule -->
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ windows.runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/Runner.rc'>Runner.rc</a></b></td>
							<td style='padding: 8px;'>- Defines application metadata and resources for the Windows build of the dental_clinic_mobile project, including icons, version info, and localization details<br>- Facilitates consistent branding and system recognition within the overall architecture, ensuring the application appears correctly in Windows environments and maintains version integrity across releases.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/flutter_window.cpp'>flutter_window.cpp</a></b></td>
							<td style='padding: 8px;'>- Facilitates the creation and management of a Flutter-based window within a Windows environment, integrating Flutter rendering and plugin registration into the native application lifecycle<br>- Ensures proper initialization, message handling, and cleanup of the Flutter engine and view, enabling seamless embedding of Flutter content into the Windows applications architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/flutter_window.h'>flutter_window.h</a></b></td>
							<td style='padding: 8px;'>- Defines a Flutter window within a Windows environment, serving as a container that hosts and manages a Flutter view<br>- Facilitates integration of Flutter UI components into native Windows applications by initializing, displaying, and handling the lifecycle of the embedded Flutter engine and view controller<br>- Acts as a bridge between native Windows window management and Flutter rendering.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build configuration for the Windows runner executable, orchestrating compilation, linking, and integration of Flutter components with native Windows APIs<br>- It ensures proper setup of dependencies, versioning, and platform-specific settings, enabling seamless execution of the Flutter application on Windows within the overall project architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/win32_window.h'>win32_window.h</a></b></td>
							<td style='padding: 8px;'>- Defines a high DPI-aware Win32 window abstraction facilitating creation, display, and management of native Windows GUI elements<br>- Enables customization of rendering and input handling through inheritance, manages window lifecycle events, and ensures seamless DPI scaling and theme integration, serving as a foundational component for building Windows-based user interfaces within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/main.cpp'>main.cpp</a></b></td>
							<td style='padding: 8px;'>- Initialize and launch the Windows desktop application for the dental clinic mobile project, establishing the main user interface window and integrating Flutters rendering engine<br>- It manages application startup, event handling, and ensures proper setup of Dart runtime environment, serving as the entry point that connects the Flutter-based UI with native Windows functionalities within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/resource.h'>resource.h</a></b></td>
							<td style='padding: 8px;'>- Defines visual resources for the Windows runner, including application icons and UI element identifiers, facilitating consistent and organized resource management within the overall architecture<br>- Supports the integration of graphical assets into the Windows environment, ensuring proper display and functionality of the runner interface.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/utils.cpp'>utils.cpp</a></b></td>
							<td style='padding: 8px;'>- Facilitates Windows-specific utility functions to enhance console management and command-line argument processing within the application<br>- Enables console creation for output visibility and converts command-line inputs from UTF-16 to UTF-8 encoding, ensuring proper communication between the Windows environment and the Flutter engine<br>- Supports seamless integration and user interaction in Windows-based deployments of the project.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/runner.exe.manifest'>runner.exe.manifest</a></b></td>
							<td style='padding: 8px;'>- Defines the application manifest for the Windows runner executable, specifying DPI awareness and OS compatibility settings<br>- Ensures the runner operates correctly across Windows 10 and 11 by configuring display scaling behavior and supporting the appropriate operating system versions within the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/utils.h'>utils.h</a></b></td>
							<td style='padding: 8px;'>- Provides utility functions to facilitate Windows process management and command-line handling within the codebase<br>- It enables creating console windows with redirected output streams and converting command-line arguments from UTF-16 to UTF-8 encoding, supporting seamless integration of Windows-specific process interactions and argument parsing in the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/runner/win32_window.cpp'>win32_window.cpp</a></b></td>
							<td style='padding: 8px;'>- Implements window management for a Windows desktop application within the Flutter architecture, handling window creation, theming, DPI scaling, and message processing<br>- Facilitates seamless integration of native Win32 window functionalities, ensuring proper rendering, theme adaptation, and user interactions, thereby supporting a consistent and responsive user interface across different display configurations.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- flutter Submodule -->
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ windows.flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates the registration of Flutter plugins within the Windows platform, ensuring seamless integration of native functionalities into the Flutter application<br>- Serves as a crucial component in the project’s plugin management architecture, enabling dynamic plugin initialization during app startup to support extended features and platform-specific capabilities.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build process for integrating Flutters Windows platform into the project architecture<br>- It manages the compilation and linking of Flutters core libraries, platform-specific wrappers, and plugin support, ensuring seamless communication between Flutter and native Windows components<br>- This setup facilitates the deployment of Flutter-based Windows applications within the overall codebase.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
							<td style='padding: 8px;'>- Defines the integration of Flutter plugins for Windows, ensuring proper linkage and inclusion of essential plugins such as cloud_firestore, firebase_auth, and firebase_storage<br>- Facilitates seamless plugin management within the build process, enabling the application to leverage cloud services, file handling, and Firebase functionalities effectively across the Windows platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/windows/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific plugins for Windows within the Flutter application, enabling seamless integration of Firebase services and file selection capabilities<br>- This code ensures that the necessary plugin components are correctly initialized and linked during app startup, facilitating smooth communication between Flutter and native Windows functionalities across the apps architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- macos Submodule -->
	<details>
		<summary><b>macos</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ macos</b></code>
			<!-- Flutter Submodule -->
			<details>
				<summary><b>Flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.Flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/macos/Flutter/GeneratedPluginRegistrant.swift'>GeneratedPluginRegistrant.swift</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific Flutter plugins for macOS, enabling seamless integration of Firebase services, local notifications, file selection, shared preferences, and database functionalities within the application<br>- This setup ensures that all necessary plugins are correctly initialized and available for use across the macOS environment, supporting the app’s core features and enhancing cross-platform consistency.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- Runner Submodule -->
			<details>
				<summary><b>Runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.Runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/macos/Runner/AppDelegate.swift'>AppDelegate.swift</a></b></td>
							<td style='padding: 8px;'>- Defines the application lifecycle behavior for the macOS version of the project, ensuring proper termination and state restoration<br>- Integrates Flutter with native macOS features, facilitating seamless app operation and user experience consistency within the overall architecture<br>- Acts as the entry point for app initialization and window management in the Flutter-based desktop environment.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/macos/Runner/DebugProfile.entitlements'>DebugProfile.entitlements</a></b></td>
							<td style='padding: 8px;'>- Defines security entitlements for the macOS application, enabling sandboxing, allowing runtime code execution, and permitting network server operations<br>- These settings ensure the app operates securely within macOS while supporting necessary functionalities such as Just-In-Time compilation and network communication, integral to the overall architecture of the project’s macOS platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/macos/Runner/Release.entitlements'>Release.entitlements</a></b></td>
							<td style='padding: 8px;'>- Defines security permissions for the macOS application, specifically enabling sandboxing to restrict app capabilities and enhance security<br>- This configuration ensures the app operates within a controlled environment, aligning with the overall architectures emphasis on security and stability for the desktop platform.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/macos/Runner/MainFlutterWindow.swift'>MainFlutterWindow.swift</a></b></td>
							<td style='padding: 8px;'>- Defines the main application window for the macOS platform, integrating Flutters rendering engine within a native Cocoa environment<br>- It establishes the windows structure, embeds the Flutter view controller, and registers generated plugins, enabling seamless communication between native macOS components and Flutter-based UI, thereby serving as the foundational entry point for the app's user interface architecture.</td>
						</tr>
					</table>
					<!-- Assets.xcassets Submodule -->
					<details>
						<summary><b>Assets.xcassets</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ macos.Runner.Assets.xcassets</b></code>
							<!-- AppIcon.appiconset Submodule -->
							<details>
								<summary><b>AppIcon.appiconset</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ macos.Runner.Assets.xcassets.AppIcon.appiconset</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/macos/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json'>Contents.json</a></b></td>
											<td style='padding: 8px;'>- Defines the set of application icons for the macOS version, specifying various sizes and resolutions to ensure consistent visual branding across different display contexts<br>- Integrates seamlessly into the overall app architecture by providing necessary visual assets for the apps iconography, supporting a polished user experience and adherence to platform standards.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
			<!-- RunnerTests Submodule -->
			<details>
				<summary><b>RunnerTests</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ macos.RunnerTests</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/macos/RunnerTests/RunnerTests.swift'>RunnerTests.swift</a></b></td>
							<td style='padding: 8px;'>- Provides a foundational test structure for the macOS Flutter application, enabling validation of core functionalities within the Runner environment<br>- Serves as a starting point for implementing unit tests to ensure stability and correctness of the app’s integration with macOS-specific components, supporting overall code quality and reliability in the project architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- linux Submodule -->
	<details>
		<summary><b>linux</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ linux</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/CMakeLists.txt'>CMakeLists.txt</a></b></td>
					<td style='padding: 8px;'>- Configures the build environment for a cross-platform desktop application utilizing Flutter and GTK, orchestrating compilation, dependencies, and resource management<br>- Ensures proper bundling, asset integration, and optimized release builds, facilitating seamless deployment of the dental_clinic_mobile application within the overall project architecture.</td>
				</tr>
			</table>
			<!-- runner Submodule -->
			<details>
				<summary><b>runner</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ linux.runner</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/runner/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build configuration for the Linux runner application, specifying source files, dependencies, and build settings<br>- It orchestrates the compilation process to produce the executable, integrating Flutter and GTK libraries to enable a cross-platform graphical interface within the overall project architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/runner/main.cc'>main.cc</a></b></td>
							<td style='padding: 8px;'>- Initialize and launch the application within the Linux environment, serving as the entry point for the overall software system<br>- It sets up the application instance and manages its execution flow, ensuring seamless startup and integration with the broader architecture<br>- This core component facilitates the transition from system initialization to user interaction, anchoring the applications operational lifecycle.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/runner/my_application.h'>my_application.h</a></b></td>
							<td style='padding: 8px;'>- Defines the MyApplication class as a GTK-based Flutter application, serving as the core entry point for initializing and managing the applications lifecycle within the Linux environment<br>- It facilitates the integration of Flutter with GTK, enabling seamless startup and operation of the Flutter-based user interface on Linux platforms.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/runner/my_application.cc'>my_application.cc</a></b></td>
							<td style='padding: 8px;'>- Defines the core application structure and lifecycle management for a Flutter-based desktop app on Linux<br>- It handles window creation, platform-specific UI adjustments, and integrates Flutter rendering with native GTK components<br>- Facilitates seamless startup, command-line processing, and shutdown procedures, ensuring proper application registration and plugin registration within the overall architecture.</td>
						</tr>
					</table>
				</blockquote>
			</details>
			<!-- flutter Submodule -->
			<details>
				<summary><b>flutter</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ linux.flutter</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/flutter/generated_plugin_registrant.h'>generated_plugin_registrant.h</a></b></td>
							<td style='padding: 8px;'>- Facilitates the registration of Flutter plugins within the Linux platform, ensuring seamless integration of native functionalities into the Flutter application<br>- Serves as a crucial component in the plugin management architecture, enabling the dynamic loading and initialization of plugins to extend app capabilities on Linux systems.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/flutter/CMakeLists.txt'>CMakeLists.txt</a></b></td>
							<td style='padding: 8px;'>- Defines the build process for integrating Flutters Linux library into the project, managing dependencies, configurations, and compilation steps<br>- Ensures that Flutters core components and platform-specific assets are correctly assembled and linked, facilitating seamless embedding of Flutter UI within the Linux environment as part of the overall architecture.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/flutter/generated_plugins.cmake'>generated_plugins.cmake</a></b></td>
							<td style='padding: 8px;'>- Facilitates integration of Flutter plugins into the Linux build system by dynamically including plugin directories and linking their libraries<br>- Ensures seamless incorporation of platform-specific plugin components, enabling the application to access extended functionalities provided by Flutter plugins on Linux<br>- Supports modular plugin management, maintaining an organized and scalable architecture for plugin inclusion during build time.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/linux/flutter/generated_plugin_registrant.cc'>generated_plugin_registrant.cc</a></b></td>
							<td style='padding: 8px;'>- Registers platform-specific plugins for Linux within the Flutter application, enabling seamless integration of native functionalities such as file selection<br>- Serves as a crucial component in the plugin registration process, ensuring that the FileSelectorPlugin is properly initialized and available for use during app runtime, thereby facilitating cross-platform consistency and extensibility.</td>
						</tr>
					</table>
				</blockquote>
			</details>
		</blockquote>
	</details>
	<!-- android Submodule -->
	<details>
		<summary><b>android</b></summary>
		<blockquote>
			<div class='directory-path' style='padding: 8px 0; color: #666;'>
				<code><b>⦿ android</b></code>
			<table style='width: 100%; border-collapse: collapse;'>
			<thead>
				<tr style='background-color: #f8f9fa;'>
					<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
					<th style='text-align: left; padding: 8px;'>Summary</th>
				</tr>
			</thead>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/build.gradle'>build.gradle</a></b></td>
					<td style='padding: 8px;'>- Defines the build configuration and dependency management for the Android project, establishing the Kotlin version, repositories, and Gradle plugin<br>- Sets up the overall build environment, including project directories and cleanup tasks, ensuring a consistent and efficient build process across all subprojects within the architecture.</td>
				</tr>
				<tr style='border-bottom: 1px solid #eee;'>
					<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/settings.gradle'>settings.gradle</a></b></td>
					<td style='padding: 8px;'>- Defines project-wide plugin management and build configurations for the Android segment of the Flutter application<br>- It integrates Flutter SDK, applies essential plugins, and sets up repositories, ensuring consistent build environments and dependencies across the app<br>- This setup facilitates seamless integration of Flutter and native Android components within the overall architecture.</td>
				</tr>
			</table>
			<!-- app Submodule -->
			<details>
				<summary><b>app</b></summary>
				<blockquote>
					<div class='directory-path' style='padding: 8px 0; color: #666;'>
						<code><b>⦿ android.app</b></code>
					<table style='width: 100%; border-collapse: collapse;'>
					<thead>
						<tr style='background-color: #f8f9fa;'>
							<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
							<th style='text-align: left; padding: 8px;'>Summary</th>
						</tr>
					</thead>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/app/build.gradle'>build.gradle</a></b></td>
							<td style='padding: 8px;'>- Defines the Android build configuration for the dental clinic mobile app, integrating essential plugins such as Flutter, Kotlin, and Firebase services<br>- Establishes compile SDK versions, application identifiers, and build types, ensuring proper setup for app compilation, signing, and deployment within the overall project architecture<br>- Facilitates seamless integration of native Android and Flutter components.</td>
						</tr>
						<tr style='border-bottom: 1px solid #eee;'>
							<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/app/google-services.json'>google-services.json</a></b></td>
							<td style='padding: 8px;'>- Configure Firebase services for the Android application, enabling seamless integration with Firebase backend features such as real-time database, authentication, and cloud storage<br>- This setup ensures the app can securely communicate with Firebase, supporting core functionalities like data synchronization, user management, and cloud-based operations within the overall architecture of the dental clinic mobile platform.</td>
						</tr>
					</table>
					<!-- src Submodule -->
					<details>
						<summary><b>src</b></summary>
						<blockquote>
							<div class='directory-path' style='padding: 8px 0; color: #666;'>
								<code><b>⦿ android.app.src</b></code>
							<!-- profile Submodule -->
							<details>
								<summary><b>profile</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.profile</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/app/src/profile/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the necessary internet permission for development and debugging purposes within the Android profile build of the project<br>- It ensures the application can communicate over the network during development activities such as hot reload and breakpoint debugging, supporting seamless integration between the Flutter tool and the Android environment<br>- This setup facilitates efficient testing and debugging workflows in the overall app architecture.</td>
										</tr>
									</table>
								</blockquote>
							</details>
							<!-- main Submodule -->
							<details>
								<summary><b>main</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.main</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/app/src/main/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the main application configuration for the Android platform within the Dental Clinic project, establishing the apps entry point, theme, and intent filters<br>- Facilitates seamless integration of Flutter UI components and ensures proper handling of system interactions like text processing, supporting the overall architecture of a Flutter-based mobile application.</td>
										</tr>
									</table>
									<!-- kotlin Submodule -->
									<details>
										<summary><b>kotlin</b></summary>
										<blockquote>
											<div class='directory-path' style='padding: 8px 0; color: #666;'>
												<code><b>⦿ android.app.src.main.kotlin</b></code>
											<!-- com Submodule -->
											<details>
												<summary><b>com</b></summary>
												<blockquote>
													<div class='directory-path' style='padding: 8px 0; color: #666;'>
														<code><b>⦿ android.app.src.main.kotlin.com</b></code>
													<!-- example Submodule -->
													<details>
														<summary><b>example</b></summary>
														<blockquote>
															<div class='directory-path' style='padding: 8px 0; color: #666;'>
																<code><b>⦿ android.app.src.main.kotlin.com.example</b></code>
															<!-- dental_clinic_mobile Submodule -->
															<details>
																<summary><b>dental_clinic_mobile</b></summary>
																<blockquote>
																	<div class='directory-path' style='padding: 8px 0; color: #666;'>
																		<code><b>⦿ android.app.src.main.kotlin.com.example.dental_clinic_mobile</b></code>
																	<table style='width: 100%; border-collapse: collapse;'>
																	<thead>
																		<tr style='background-color: #f8f9fa;'>
																			<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
																			<th style='text-align: left; padding: 8px;'>Summary</th>
																		</tr>
																	</thead>
																		<tr style='border-bottom: 1px solid #eee;'>
																			<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/app/src/main/kotlin/com/example/dental_clinic_mobile/MainActivity.kt'>MainActivity.kt</a></b></td>
																			<td style='padding: 8px;'>- Defines the main entry point for the Android application within the Flutter framework, enabling seamless integration of Flutters UI components with native Android functionalities<br>- Serves as the bridge that launches the app on Android devices, ensuring proper initialization and rendering of the mobile interface within the overall project architecture.</td>
																		</tr>
																	</table>
																</blockquote>
															</details>
														</blockquote>
													</details>
												</blockquote>
											</details>
										</blockquote>
									</details>
								</blockquote>
							</details>
							<!-- debug Submodule -->
							<details>
								<summary><b>debug</b></summary>
								<blockquote>
									<div class='directory-path' style='padding: 8px 0; color: #666;'>
										<code><b>⦿ android.app.src.debug</b></code>
									<table style='width: 100%; border-collapse: collapse;'>
									<thead>
										<tr style='background-color: #f8f9fa;'>
											<th style='width: 30%; text-align: left; padding: 8px;'>File Name</th>
											<th style='text-align: left; padding: 8px;'>Summary</th>
										</tr>
									</thead>
										<tr style='border-bottom: 1px solid #eee;'>
											<td style='padding: 8px;'><b><a href='https://github.com/LyNNxMooon/Dental-Clinic-Mobile/blob/master/android/app/src/debug/AndroidManifest.xml'>AndroidManifest.xml</a></b></td>
											<td style='padding: 8px;'>- Defines the necessary internet permission for development activities within the Android environment, enabling communication between the Flutter tool and the application during debugging, hot reload, and other development workflows<br>- This setup ensures smooth integration and testing processes, supporting efficient iteration and troubleshooting within the overall app architecture.</td>
										</tr>
									</table>
								</blockquote>
							</details>
						</blockquote>
					</details>
				</blockquote>
			</details>
		</blockquote>
	</details>
</details>

---

## Getting Started

### Prerequisites

This project requires the following dependencies:

- **Programming Language:** Dart
- **Package Manager:** Pub, Cmake, Gradle

### Installation

Build Dental-Clinic-Mobile from the source and install dependencies:

1. **Clone the repository:**

    ```sh
    ❯ git clone https://github.com/LyNNxMooon/Dental-Clinic-Mobile
    ```

2. **Navigate to the project directory:**

    ```sh
    ❯ cd Dental-Clinic-Mobile
    ```

3. **Install the dependencies:**

**Using [pub](https://dart.dev/):**

```sh
❯ pub get
```
**Using [cmake](https://isocpp.org/):**

```sh
❯ cmake . && make
```
**Using [gradle](https://gradle.org/):**

```sh
❯ gradle build
```

### Usage

Run the project with:

**Using [pub](https://dart.dev/):**

```sh
dart {entrypoint}
```
**Using [cmake](https://isocpp.org/):**

```sh
./Dental-Clinic-Mobile
```
**Using [gradle](https://gradle.org/):**

```sh
gradle run
```

### Testing

Dental-clinic-mobile uses the {__test_framework__} test framework. Run the test suite with:

**Using [pub](https://dart.dev/):**

```sh
pub run test
```
**Using [cmake](https://isocpp.org/):**

```sh
ctest
```
**Using [gradle](https://gradle.org/):**

```sh
gradle test
```

---

<div align="left"><a href="#top">⬆ Return</a></div>

---
