//
//  SwiftUICarousel.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/27/23.

import SwiftUI


struct SwiftUICarousel: View {
    struct Trip: Identifiable {
        var id = UUID()
        var destination: String
        var image: String
    }

   private let sampleTrips = [
        Trip(destination: "Paris", image: "paris"),
        Trip(destination: "Florence", image: "florence"),
        Trip(destination: "Amsterdam", image: "amsterdam"),
        Trip(destination: "Ghent", image: "ghent"),
        Trip(destination: "Santorini", image: "santorini"),
        Trip(destination: "Budapest", image: "budapest"),
        Trip(destination: "London", image: "london"),
        Trip(destination: "Cuba", image: "cuba"),
        Trip(destination: "Osaka", image: "osaka"),
        Trip(destination: "Kyoto", image: "kyoto"),
        Trip(destination: "Seoul", image: "seoul"),
        Trip(destination: "Sydney", image: "sydney"),
        Trip(destination: "Hong Kong", image: "hongkong")
    ]
    @State private var currentTripIndex = 2
    @State private var isCardTapped = false
    @GestureState private var dragOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            // Title Bar
            VStack(alignment: .leading) {
                Text("Discover")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                Text("Explore your next destination")
                    .font(.system(.headline, design: .rounded))
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
            .padding(.top, 25)
            .padding(.leading, 20)
            .opacity(self.isCardTapped ? 0.1 : 1.0)
            .offset(y: self.isCardTapped ? -100 : 0)
            
            // Carousel
            GeometryReader { outerView in
                HStack(spacing: 0) {
                    ForEach(sampleTrips.indices) { index in
                        GeometryReader { innerView in
                            TripCardView(destination: sampleTrips[index].destination, imageName: sampleTrips[index].image, isShowDetails: self.$isCardTapped)
                                .offset(y: self.isCardTapped ? -innerView.size.height * 0.3 : 0)
                        }
                        .padding(.horizontal, self.isCardTapped ? 0 : 20)
                        .opacity(self.currentTripIndex == index ? 1.0 : 0.7)
                        .frame(width: outerView.size.width, height: self.currentTripIndex == index ? (self.isCardTapped ? outerView.size.height : 450) : 400)
                        .onTapGesture {
                            self.isCardTapped = true
                        }
                    }
                }
                .frame(width: outerView.size.width, alignment: .leading)
                .offset(x: -CGFloat(self.currentTripIndex) * outerView.size.width)
                .offset(x: self.dragOffset)
                .gesture(
                    !self.isCardTapped ?
                        
                    DragGesture()
                        .updating(self.$dragOffset, body: { (value, state, transaction) in
                            state = value.translation.width
                        })
                        .onEnded({ (value) in
                            let threshold = outerView.size.width * 0.25
                            var newIndex = Int(-value.translation.width / threshold) + self.currentTripIndex
                            newIndex = min(max(newIndex, 0), sampleTrips.count - 1)
                            
                            self.currentTripIndex = newIndex
                        })
                    
                    : nil
                )
            }
            .animation(.interpolatingSpring(mass: 0.6, stiffness: 100, damping: 10, initialVelocity: 0.3))
            
            // Detail view
            if self.isCardTapped {
                TripDetailView(destination: sampleTrips[currentTripIndex].destination)
                    .offset(y: 200)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(mass: 0.5, stiffness: 100, damping: 10, initialVelocity: 0.3))
                
                Button(action: {
                    self.isCardTapped = false
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.black)
                        .opacity(0.7)
                        .contentShape(Rectangle())
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                .padding(.trailing)
                
            }
        }
    }
}

struct TripCardView: View {
    let destination: String
    let imageName: String
    @Binding var isShowDetails: Bool
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(self.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .cornerRadius(self.isShowDetails ? 0 : 15)
                    .overlay(
                        Text(self.destination)
                            .font(.system(.headline, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(10)
                            .background(Color.white)
                            .padding([.bottom, .leading])
                            .opacity(self.isShowDetails ? 0.0 : 1.0)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .bottomLeading)
                    )
            }
        }
    }
}

struct TripDetailView: View {
    let destination: String
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                ZStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text(self.destination)
                                .font(.system(.title, design: .rounded))
                                .fontWeight(.heavy)
                            
                            HStack(spacing: 3) {
                                ForEach(1...5, id: \.self) { _ in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                        .font(.system(size: 15))
                                }
                                
                                Text("5.0")
                                    .font(.system(.headline))
                                    .padding(.leading, 10)
                            }
                            
                        }
                        .padding(.bottom, 30)
                        
                        
                        Text("Description")
                            .font(.system(.headline))
                            .fontWeight(.medium)
                        
                        Text("Growing up in Michigan, I was lucky enough to experience one part of the Great Lakes. And let me assure you, they are great. As a photojournalist, I have had endless opportunities to travel the world and to see a variety of lakes as well as each of the major oceans. And let me tell you, you will be hard pressed to find water as beautiful as the Great Lakes.")
                            .padding(.bottom, 40)
                        
                        Button(action: {
                            // tap me
                        }) {
                            Text("Book Now")
                                .font(.system(.headline, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color(red: 0.97, green: 0.369, blue: 0.212))
                                .cornerRadius(20)
                        }
                    }
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height, alignment: .topLeading)
                    .background(Color.white)
                    .cornerRadius(15)
                    
                    Image(systemName: "bookmark.fill")
                        .font(.system(size: 40))
                        .foregroundColor(Color(red: 0.97, green: 0.369, blue: 0.212))
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topTrailing)
                        .offset(x: -15, y: -5)
                }
                .offset(y: 15)
            }
        }

    }
}

struct SwiftUICarousel_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUICarousel()
    }
}
