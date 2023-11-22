import SwiftUI

private struct MGE_Challenge1: View {
    @Namespace var namespace
    @State private var showParks = false
    @State private var searchText = ""
    private let backgroundColor = Color("Background6")
    private let accentColor = Color("Accent6")
    private let secondaryColor = Color("Secondary6")
    private let tertiaryColor = Color("Tertiary6")
    private let quaternaryColor = Color("Quaternary6")
    
    var body: some View {
        ZStack(alignment: .bottom) {
            backgroundColor
                .opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing: 40.0) {
                Text("THE GREAT OUTDOORS OF UTAH")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                ZStack(alignment: .trailing) {
                    TextField("park, trail or campsite", text: $searchText)
                        .padding()
                        .background(Capsule().fill(Color.secondary.opacity(0.2)))
                    
                    Button(action: {}, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .padding(18)
                            .background(Circle().fill(accentColor))
                    })
                }
                .padding(.horizontal)
                
                Image("blm")
                    .resizable()
                    .scaledToFit()
                    .shadow(radius: 8)
                
                if !showParks {
                    VStack {
                        HStack(alignment: .bottom) {
                            Text("PARKS")
                                .font(.title)
                                .fontWeight(.heavy)
                                .onTapGesture {
                                    withAnimation(.easeIn(duration: 0.5)) {
                                        showParks.toggle()
                                    }
                                }
                            Text("8 parks")
                                .fontWeight(.bold)
                                .baselineOffset(2)
                                .opacity(0.6)
                            Spacer()
                        }
                        .padding(24)
                        .padding(.top)
                        Spacer()
                    }
                    .background(RoundedCorner(cornerRadius: 40, corners: .topRight)
                                    .fill(quaternaryColor)
                                    .shadow(radius: 4)
                    )
                    .matchedGeometryEffect(id: "parksBackground", in: namespace)
                    .frame(height: 440)
                    .frame(maxWidth: .infinity)
                    .padding(.trailing, 120)
                    .zIndex(1)
                } else {
                    Color.clear
                        .frame(height: 440)
                }
            }
            
            if !showParks {
                VStack {
                    HStack(alignment: .bottom) {
                        Text("TRAILS")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("207 trails")
                            .fontWeight(.bold)
                            .baselineOffset(2)
                            .opacity(0.6)
                        Spacer()
                    }
                    .padding(24)
                    .padding([.leading, .top])
                    Spacer()
                }
                .frame(height: 300)
                .frame(maxWidth: .infinity)
                .background(RoundedCorner(cornerRadius: 40, corners: .topLeft)
                                .fill(secondaryColor)
                                .shadow(radius: 4))
                .padding(.leading, 90)
                .padding(.top, 110)
                .transition(.move(edge: .bottom))
                .animation(.spring(response: 0.7), value: showParks)
                .zIndex(2)
            }
            
            if !showParks {
                VStack {
                    HStack(alignment: .bottom) {
                        Text("CAMPSITES")
                            .font(.title)
                            .fontWeight(.heavy)
                        Text("121 campsites")
                            .fontWeight(.bold)
                            .baselineOffset(2)
                            .opacity(0.6)
                        Spacer()
                    }
                    .padding(24)
                    .padding(.top)
                    Spacer()
                }
                .frame(height: 160)
                .frame(maxWidth: .infinity)
                .background(RoundedCorner(cornerRadius: 40, corners: .topRight)
                                .fill(tertiaryColor)
                                .shadow(radius: 4))
                .padding(.trailing, 60)
                .padding(.top, 220)
                .transition(.move(edge: .bottom))
                .animation(.spring(response: 0.5), value: showParks)
                .zIndex(3)
            }
            
            if showParks {
                ParksListView(namespace: namespace, showParks: $showParks)
                    .animation(Animation.easeIn(duration: 0.5), value: showParks) // Opening Animation
                    .zIndex(1)
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

struct ParksListView: View {
    var namespace: Namespace.ID
    @State var selectedPark: Item?
    @State var parks = Data.getUtahNationalParks()
    @Binding var showParks: Bool
    @State private var showScrollView = false
    private let quaternaryColor = Color("Quaternary6")
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section(header: ParksHeaderView(namespace: namespace,
                                                showParks: $showParks,
                                                showScrollView: $showScrollView)) {
                    ForEach(parks) { park in
                        MGE_ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                    }
                }
                .opacity(showScrollView ? 1 : 0)
            }
        }
        
        .ignoresSafeArea(edges: .top)
        .overlay(
                MGE_ParkDetailView(namespace: namespace, selectedPark: $selectedPark)
        )
        .tint(Color("Accent6"))
        .background(RoundedCorner(cornerRadius: 40, corners: .topRight)
                        .fill(quaternaryColor)
                        .matchedGeometryEffect(id: "parksBackground", in: namespace)
                        .ignoresSafeArea())
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                withAnimation(Animation.easeIn) {
                    showScrollView = true
                }
            }
        }
    }
}

struct ParksHeaderView: View {
    var namespace: Namespace.ID
    @Binding var showParks: Bool
    @Binding var showScrollView: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemBackground)
                .opacity(0.8)
            
            HStack {
                // Back Button
                Button(action: {
                    withAnimation {
                        showParks = false
                        showScrollView = false
                    }
                }, label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.title)
                })
                .padding(.leading)
                
                Text("UTAH NATIONAL PARKS")
                    .font(.title)
                    .fontWeight(.black)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
        }
        .frame(height: 100)
    }
}

struct MGE_Challenge1_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MGE_Challenge1()
            MGE_Challenge1()
                .preferredColorScheme(.dark)
        }
    }
}
