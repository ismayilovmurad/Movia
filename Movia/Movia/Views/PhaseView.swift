//
//  PhaseView.swift
//  Movia
//
//  Created by Murad Ismayilov on 11.05.23.
//

import SwiftUI

protocol EmptyData {
    var isEmpty: Bool { get }
}

struct PhaseView<V: EmptyData>: View {
    
    let phase: DataFetchPhase<V>
    let retryAction: () -> ()
    
    var body: some View {
        switch phase {
        case .empty:
            ProgressView()
        case .success(let value) where value.isEmpty:
            EmptyPlaceholderView(text: "No data", image: Image(systemName: "film"))
        case .failure(let error):
            RetryView(text: error.localizedDescription, retryAction: retryAction)
        default:
            EmptyView()
        }
    }
}

extension Array: EmptyData {}
extension Optional: EmptyData {
    
    var isEmpty: Bool {
        if case .none = self {
            return true
        }
        return false
    }
    
}

struct PhaseView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PhaseView(phase: .success([])) {
                print("Retry")
            }
            
            PhaseView<[Movie]>(phase: .empty) {
                print("Retry")
            }
            PhaseView<Movie?>(phase: .failure(MovieError.invalidResponse)) {
                print("Retry")
            }
        }
        
        
    }
}

