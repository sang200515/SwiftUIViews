//
//  WalletView.swift
//  SwiftUI_Components
//
//  Created by Em bé cute on 11/27/23.
//

import Foundation
import SwiftUI

private enum DragState {
    case inactive
    case pressing(index: Int? = nil)
    case dragging(index: Int? = nil, translation: CGSize)

    var index: Int? {
        switch self {
        case .pressing(let index), .dragging(let index, _):
            return index
        case .inactive:
            return nil
        }
    }
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(_, let translation):
            return translation
        }
    }
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
    var isDragging: Bool {
        switch self {
        case .dragging:
            return true
        case .inactive, .pressing:
            return false
        }
    }
}

private struct TopNavBar: View {
    var body: some View {
        HStack {
            Text("Wallet")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.heavy)
            
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .font(.system(.title))
        }
        .padding(.horizontal)
        .padding(.top, 20)
    }
}

private struct WalletView: View {
    private static let testCards = [
        Card(name: "James Hayward", type: .visa, number: "4242 4242 4242 4242", expiryDate: "3/23"),
        Card(name: "Cassie Emily", type: .master, number: "5353 5353 5353 5353", expiryDate: "10/21"),
        Card(name: "Adam Green", type: .ae, number: "3737 3737 3737 3737", expiryDate: "8/22"),
        Card(name: "Donald Wayne", type: .chase, number: "6363 6263 6362 6111", expiryDate: "11/23"),
        Card(name: "Gloria Jane", type: .discover, number: "6011 0009 9013 9424", expiryDate: "5/24")
    ]
    @GestureState private var dragState = DragState.inactive
    
    @State var cards: [Card] = testCards
    
    @State var isCardPresented = false
    @State var isCardPressed = false
    @State var selectedCard: Card?
    
    private static let cardOffset: CGFloat = 50.0
    let testTransactions = [
        Transaction(merchant: "Mushroom", amount: 120.0, date: "11/2/2020", icon: "star.circle.fill"),
        Transaction(merchant: "Amazon", amount: 50.0, date: "10/2/2020", icon: "cart.fill"),
        Transaction(merchant: "MUJI", amount: 300.0, date: "8/2/2020", icon: "app.gift.fill"),
        Transaction(merchant: "Apple", amount: 800.0, date: "4/2/2020", icon: "headphones"),
        Transaction(merchant: "Netflix", amount: 19.0, date: "11/2/2020", icon: "tv"),
        Transaction(merchant: "ANA", amount: 480.0, date: "11/2/2020", icon: "airplane")
    ]
    var body: some View {
       VStack {
     
            TopNavBar()
                .padding(.bottom)
     
            Spacer()

            ZStack {
                if isCardPresented {
                    ForEach(cards) { card in
                        CardView2(card: card)
                            .offset(self.offset(for: card))
                            .animation(.default)
                            .scaleEffect(1.0)
                            .padding(.horizontal, 35)
                            .zIndex(self.zIndex(for: card))
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined(with: .opacity))
                            .animation(self.transitionAnimation(for: card))
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        withAnimation(.default) {
                                            self.isCardPressed.toggle()
                                            self.selectedCard = self.isCardPressed ? card : nil
                                        }
                                    })
                                    .exclusively(before: LongPressGesture(minimumDuration: 0.05)
                                    .sequenced(before: DragGesture())
                                    .updating(self.$dragState, body: { (value, state, transaction) in
                                        switch value {
                                        case .first(true):
                                            state = .pressing(index: self.index(for: card))
                                        case .second(true, let drag):
                                            state = .dragging(index: self.index(for: card), translation: drag?.translation ?? .zero)
                                        default:
                                            break
                                        }
                                        
                                    })
                                    .onEnded({ (value) in
                                        
                                        guard case .second(true, let drag?) = value else {
                                            return
                                        }

                                        // Rearrange the cards
                                        self.rearrangeCards(with: card, dragOffset: drag.translation)
                                    })
                            
                                )
                            )
                    }
                }
            }
            .onAppear {
                self.isCardPresented.toggle()
            }
        
            if isCardPressed {
                TransactionHistoryView(transactions: testTransactions)
                    .padding(.top, 10)
                    .transition(.move(edge: .bottom))
                    .animation(Animation.easeOut(duration: 0.15).delay(0.1))
            }
        
            Spacer()
        }
    }
    
    private func rearrangeCards(with card: Card, dragOffset: CGSize) {
        guard let draggingCardIndex = index(for: card) else {
            return
        }
        
        var newIndex = draggingCardIndex + Int(-dragOffset.height / Self.cardOffset)
        newIndex = newIndex >= cards.count ? cards.count - 1 : newIndex
        newIndex = newIndex < 0 ? 0 : newIndex
                
        let removedCard = cards.remove(at: draggingCardIndex)
        cards.insert(removedCard, at: newIndex)
        
    }
    
    private func transitionAnimation(for card: Card) -> Animation {
        
        var delay = 0.0
        
        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }
        
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
    
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else {
            return 0.0
        }
        
        // The default z-index of a card is set to a negative value of the card's index,
        // so that the first card will have the largest z-index.
        let defaultZIndex = -Double(cardIndex)
        
        // If it's the dragging card
        if let draggingIndex = dragState.index,
            cardIndex == draggingIndex {
            // we compute the new z-index based on the translation's height
            return defaultZIndex + Double(dragState.translation.height/Self.cardOffset)
        }
        
        // Otherwise, we return the default z-index
        return defaultZIndex
    }
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else {
            return nil
        }
        
        return index
    }
    
    private func offset(for card: Card) -> CGSize {

        guard let cardIndex = index(for: card) else {
            return CGSize()
        }
        
        if isCardPressed {
            guard let selectedCard = self.selectedCard,
                let selectedCardIndex = index(for: selectedCard) else {
                    return .zero
            }
            
            if cardIndex >= selectedCardIndex {
                return .zero
            }
            
            let offset = CGSize(width: 0, height: 1400)
            
            return offset
        }
        
        var pressedOffset = CGSize.zero
        var dragOffsetY: CGFloat = 0.0
        
        if let draggingIndex = dragState.index,
            cardIndex == draggingIndex {
            pressedOffset.height = dragState.isPressing ? -20 : 0
            
            switch dragState.translation.width {
            case let width where width < -10: pressedOffset.width = -20
            case let width where width > 10: pressedOffset.width = 20
            default: break
            }

            dragOffsetY = dragState.translation.height
        }
        
        return CGSize(width: 0 + pressedOffset.width, height: -50 * CGFloat(cardIndex) + pressedOffset.height + dragOffsetY)
    }
  
}
private struct Transaction: Identifiable {
    var id = UUID()
    var merchant: String
    var amount: Double
    var date: String
    var icon: String = "dollarsign.circle.fill"
}


private struct TransactionHistoryView: View {
    var transactions: [Transaction]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Transaction History")
                .font(.system(size: 25, weight: .black, design: .rounded))
                .padding()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(transactions) { transaction in
                        TransactionView(transaction: transaction)
                    }
                }
                .padding()
            }
        }
    }
}

private struct TransactionView: View {
    var transaction: Transaction
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(UIColor.systemGray5))
            .overlay(
                VStack {
                    Spacer()
                    
                    Image(systemName: transaction.icon)
                        .font(.system(size: 50))
                        .padding(.bottom, 10)
                    
                    Text(transaction.merchant)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text("$\(String(format: "%.1f", transaction.amount))")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .padding(.bottom, 30)
                    
                    Text(transaction.date)
                        .font(.system(.caption, design: .rounded))
                    
                    Spacer()
                }
                    
            )
            .frame(width: 200, height: 300)
            
    }
}

private struct CardView2: View {
    var card: Card
    
    var body: some View {
        Image(card.image)
            .resizable()
            .scaledToFit()
            .overlay(
                VStack(alignment: .leading) {
                    Text(card.number)
                        .bold()
                    
                    HStack {
                        Text(card.name)
                            .bold()
                        Text("Valid Thru")
                            .font(.footnote)
                        Text(card.expiryDate)
                            .font(.footnote)
                    }
                }
                .foregroundColor(.white)
                .padding(.leading, 25)
                .padding(.bottom, 20)

            , alignment: .bottomLeading)
            .shadow(color: .gray, radius: 1.0, x: 0.0, y: 1.0)
    }
}
private enum CardType: String {
    case visa
    case master
    case ae
    case chase
    case discover
}

private struct Card: Identifiable {
    var id = UUID()
    var name: String
    var type: CardType
    var number: String
    var expiryDate: String
    var image: String {
        return type.rawValue
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
