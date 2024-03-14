//
//  SearchBar.swift
//  LMessenger
//
//
//
//import SwiftUI
//
//struct SearchBar: UIViewRepresentable {
//    @Binding var text: String
//   // @Binding var shouldBecomeFirstResponder: Bool
//  //  var onClickedSearchButton: (() -> Void)?
//    
//    init(text: Binding<String>) {
//        self._text = text
//    }
//    
//    func makeCoordinator() -> Coordinator {
//        Coordinator(text: $text)
//    }
//    
//    func makeUIView(context: Context) -> UISearchBar {
//        let searchBar = UISearchBar(frame: .zero)
//        searchBar.searchBarStyle = .minimal
//        searchBar.delegate = context.coordinator
//        return searchBar
//    }
//    
//    func updateUIView(_ searchBar: UISearchBar, context: Context) {
////        updateSearchText(searchBar, context: context)
////        updateBecomeFirstResponder(searchBar, context: context)
//    }
//    
//   
////    
////    private func updateBecomeFirstResponder(_ searchBar: UISearchBar, context: Context) {
////        guard searchBar.canBecomeFirstResponder else { return }
////        
////        DispatchQueue.main.async {
////            if shouldBecomeFirstResponder {
////                guard !searchBar.isFirstResponder else { return }
////                searchBar.becomeFirstResponder()
////            } else {
////                guard searchBar.isFirstResponder else { return }
////                searchBar.resignFirstResponder()
////            }
////        }
//    }
//
//
//extension SearchBar {
//    
//    class Coordinator: NSObject, UISearchBarDelegate {
//        @Binding var text: String
//       // @Binding var shouldBecomeFirstResponder: Bool
//       // var onClickedSearchButton: (() -> Void)?
//        
//        init(text: String) {
//            self.text = text
//        }
//        
//        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//            self.text = searchText
//        }
//        
//    }
//}
