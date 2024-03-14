//
//  NewEmojiRatingView.swift
//  KitapKurdu
//
//  Created by Ercan Kabali on 13.03.2024.
//

import SwiftUI

struct NewEmojiRatingView: View {
    let rating: Int

       var body: some View {
           switch rating {
                   case 1:
                       Text("☹️")

                   case 2:
                       Text("🥱")

                   case 3:
                       Text("🫤")

                   case 4:
                       Text("😊")

                   default:
                       Text("🤯")
                   }
       }
    
}

#Preview {
    NewEmojiRatingView(rating: 3)
}
