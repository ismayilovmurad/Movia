//
//  MovieHomeView.swift
//  Movia
//
//  Created by Murad Ismayilov on 11.05.23.
//

import SwiftUI

struct MovieHomeView: View {
    
    @StateObject private var movieHomeState = MovieHomeState()
    
    var body: some View {
        List {
            ForEach(movieHomeState.sections) {
                MovieThumbnailCarouselView(
                    movies: $0.movies,
                    thumbnailType: $0.thumbnailType)
            }
            .listRowInsets(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
            .listRowSeparator(.hidden)
        }
        .task { loadMovies(invalidateCache: false) }
        .refreshable { loadMovies(invalidateCache: true) }
        .overlay(PhaseView(
            phase: movieHomeState.phase,
            retryAction: { loadMovies(invalidateCache: true) })
        )
        .listStyle(.plain)
        .navigationTitle("Upcoming Movies")
    }
    
    @Sendable
    private func loadMovies(invalidateCache: Bool) {
        Task { await movieHomeState.loadMoviesFromAllEndpoints(invalidateCache: invalidateCache) }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieHomeView()
        }
    }
}


