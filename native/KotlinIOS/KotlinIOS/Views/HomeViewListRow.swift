//
//  HomeViewListRow.swift
//  KotlinIOS
//
//  Created by Dmitri 222 on 10/11/19.



// Colors



import Foundation
import SwiftUI
import SharedCode

let background = "#f7f9f9"
let regtext   = "#333333"
let labeltext = "#828995"
let green  = "#14c1a4"
let red = "#e86565"
let primaryblue =  "#59a2fd"
let backgrounddarkest  = "#e7e8ea"
let bkDark = "#2f3746"
let bkDarkDark = "#232b38"
let white = "#ffffff"

struct HomeViewListRow: View {

    var ideaModel: IdeaModel
    
    @State private var changeColor = false
   
    var body: some View {

            HStack {
                VStack (alignment:.leading) {
                    Text(ideaModel.securityTicker)
                        .foregroundColor(Color.init(hex: white))
                        .fontWeight(.bold)
                    Text(ideaModel.securityName)
                        //.foregroundColor(Color.init(hex: labeltext))
                        .foregroundColor(Color.init(hex: white))
                        .fontWeight(.medium)
                    Text("By: \(ideaModel.createdBy)")
                       // .foregroundColor(Color.init(hex: labeltext))
                        .foregroundColor(Color.init(hex: white))
                        .fontWeight(.medium)
                }
                Spacer()
                VStack (alignment:.trailing) {
                    HStack{
                        Image(ideaModel.alpha >= 4 ? "fishgreen" : (ideaModel.alpha >= 3 ? "fishyellow" : "fishred")).resizable().frame(width: 40, height: 40)
                            .padding(.top, 30)
                            .padding(.trailing, -7)
                      Text( String(format: "%.2f", ideaModel.alpha))
                        .fontWeight(.regular)
                        .foregroundColor(changeColor ? Color.green : Color.init(hex:(Colors().colorWhite)))
                        .padding(.top, 10)
                        .onAppear(){
                            withAnimation(.easeIn(duration: 1.0)){
                                if (self.ideaModel.alpha > 4){
                                    self.changeColor.toggle()
                                    let seconds = 2.0
                                          DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
                                             self.changeColor.toggle()
                                    }
                                }
                            }
                            
                        }
                       
                        
                    }
                    HStack{
                    
                                        Text( "φ")
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.init(hex: white))
                    .padding(.top, -28)
                                        Text( String(format: "%.2f", ideaModel.benchMarkPerformance))
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.init(hex: white))
                    .padding(.top, -25)
                                  }
                }
               
            }
            .lineSpacing(4)
            .padding(.leading, 3)
            .padding(.trailing, 5)
            .background(Color.clear)
        
    }
}

struct HomeViewListRow_Preview: PreviewProvider {
   
    static var previews: some View {
        Group {
        HomeViewListRow(ideaModel: IdeaSample.sharedInstance.ideaModelSample)
        .previewLayout(.fixed(width: 400, height: 100
            )).background(AnimatedBackground())
        }
    }
}
//φ
