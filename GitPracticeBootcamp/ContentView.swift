//
//  ContentView.swift
//  GitPracticeBootcamp
//
//  Created by Christian Francis on 2024-11-20.
//

import SwiftUI

struct GuidelineItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let image: String
    let description: String
}

struct ContentView: View {
    
    
    let guidelinesData: [GuidelineItem] = [
        .init(title: "No personal information", image: "📵", description: "Don't post names, phone numbers, etc."),
        .init(title: "No harassment", image: "❌", description: "No bullying, racism, or threats"),
        .init(title: "No NSFW content", image: "🔞", description: "No porn or disturbing content, duh"),
        .init(title: "Stay positive", image: "😉", description: "Good vibes only")
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            
            VStack(spacing: 50) {
                header
                subheader
            }
            
            notice
    
            guidelines
            
            footer
            
            button
            
            Spacer()
        }
        .padding()
    }
    
    private var header: some View {
        Text("Flok.")
            .font(.custom("Arial Rounded MT Bold", size: 48))
            .foregroundStyle(.black)
    }
    
    private var subheader: some View {
        Text("Community Guidelines")
            .font(.custom("Arial Rounded MT Bold", size: 28))
            .foregroundStyle(.black)
    }
    
    private var notice: some View {
        Text("Please read and agree to each Community Rule to continue. Violations could result in being banned.")
            .font(.custom("Arial Rounded MT Bold", size: 16))
            .foregroundStyle(.gray.opacity(0.8))
            .multilineTextAlignment(.center)
            .padding()
    }
    
    private var guidelines: some View {
        VStack(spacing: 0) {
            ForEach(guidelinesData) { guideline in
                CommunityGuidelineView {
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(guideline.title)
                                .font(.headline)
                            Text(guideline.image)
                        }
                        Text(guideline.description)
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
    }
    
    private var footer: some View {
        Text("We take this very seriously...")
            .foregroundStyle(.gray)
            .font(.headline)
            .padding(.top, 20)
    }
    
    private var button: some View {
        Button {
            //
        } label: {
            Text("I promise")
        }
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.blue)
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .padding(.top, 20)
    }
}

struct CommunityGuidelineView<Content: View>: View {
    
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.gray.opacity(0.08))
            .cornerRadius(10)
            .padding(.horizontal, 20)
            .padding(.vertical, (10))
    }
}


#Preview {
    ContentView()
}
