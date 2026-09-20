//
//  SettingsView.swift
//  Feather
//
//  Created by samara on 10.04.2025.
//

import SwiftUI
import NimbleViews

// MARK: - View
struct SettingsView: View {
	private let _githubUrl = "https://github.com/noname7821/NicheLoaderr"
	// MARK: Body
    var body: some View {
		NBNavigationView(.localized("Settings")) {
			Form {
				_feedback()
				
				Section {
					NavigationLink(destination: AppearanceView()) {
                        Label(.localized("Appearance"), systemImage: "paintbrush")
                    }
				}
				
				NBSection(.localized("Features")) {
                    NavigationLink(destination: LogsView(manager: LogsManager.shared)) {
                        Label(.localized("Logs"), systemImage: "apple.terminal")
                    }
					NavigationLink(destination: AppFeaturesView()) {
                        Label(.localized("App Features"), systemImage: "sparkles")
                    }
					NavigationLink(destination: CertificatesView()) {
                        Label(.localized("Certificates"), systemImage: "signature")
                    }
					NavigationLink(destination: ConfigurationView()) {
                        Label(.localized("Signing Options"), systemImage: "gear")
                    }
					NavigationLink(destination: ArchiveView()) {
                        Label(.localized("Archive & Extraction"), systemImage: "archivebox")
                    }
					#if SERVER
					NavigationLink(destination: ServerView()) {
                        Label(.localized("Server & SSL"), systemImage: "server.rack")
                    }
					#elseif IDEVICE
					NavigationLink(destination: TunnelView()) {
                        Label(.localized("Tunnel & Pairing"), systemImage: "network")
                    }
					#endif
				}
				
				_directories()
                
                Section {
                    NavigationLink(destination: ResetView()) {
                        Label(.localized("Reset"), systemImage: "trash")
                    }
                } footer: {
                    Text(.localized("Reset the applications sources, certificates, apps, and general contents."))
                }

            }
        }
    }
}

// MARK: - View extension
extension SettingsView {
	@ViewBuilder
	private func _feedback() -> some View {
		Section {
			NavigationLink(destination: AboutNyaView()) {
                Label(.localized("About"), systemImage: "info.circle")
            }
			Button(.localized("GitHub Repository"), systemImage: "safari") {
				UIApplication.open(_githubUrl)
			}
		}
	}
	
	@ViewBuilder
	private func _directories() -> some View {
		NBSection(.localized("Misc")) {
			Button(.localized("Open Documents"), systemImage: "folder") {
				UIApplication.open(URL.documentsDirectory.toSharedDocumentsURL()!)
			}
			Button(.localized("Open Archives"), systemImage: "folder") {
				UIApplication.open(FileManager.default.archives.toSharedDocumentsURL()!)
			}
		} footer: {
			Text(.localized("All of NicheLoader files except certificates are contained in the documents directory, here are some quick links to these."))
		}
	}
}
