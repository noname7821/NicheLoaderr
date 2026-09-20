//
//  AboutNyaView.swift
//  NicheLoader
//

import SwiftUI
import NimbleViews
import NimbleJSON

// MARK: - View
struct AboutNyaView: View {
	private let _dataService = NBFetchService()

	// MARK: Body
	var body: some View {
		NBList(.localized("About")) {
            Section {
                VStack {
                    Image(uiImage: (UIImage(named: Bundle.main.iconFileName ?? ""))! )
                        .appIconStyle(size: 72)

                    Text(Bundle.main.name)
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.accent)

                    HStack(spacing: 4) {
                        Text("Version")
                        Text(Bundle.main.version)
                    }
                    .font(.footnote)
                    .foregroundStyle(.secondary)
                }
            }
            .frame(maxWidth: .infinity)
            .listRowBackground(EmptyView())

			NBSection(.localized("Credits")) {
				_credit(name: "mintoo", desc: "Solo Developer", github: "noname7821")
			}

			NBSection("Fork") {
				Group {
					Text("NicheLoader is a fork of Ksign. All signing functionality is based on Ksign by Nyasami and Feather by khcrysalis.")
						.foregroundStyle(.secondary)
						.padding(.vertical, 2)
				}
				.transition(.slide)
			} footer: {
                Text(Bundle.main.bundleIdentifier ?? "")
            }
		}
	}
}

// MARK: - Extension: view
extension AboutNyaView {
	@ViewBuilder
	private func _credit(
		name: String?,
		desc: String?,
		github: String
	) -> some View {
		FRIconCellView(
			title: name ?? github,
			subtitle: desc ?? "",
			iconUrl: URL(string: "https://github.com/\(github).png")!,
			trailing: AnyView(
				Image(systemName: "arrow.up.right")
					.foregroundStyle(.secondary)
			)
		)
		.onTapGesture {
			if let url = URL(string: "https://github.com/\(github)") {
				UIApplication.shared.open(url)
			}
		}
	}
}
