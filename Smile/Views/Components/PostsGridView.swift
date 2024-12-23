struct PostsGridView: View {
    @State private var selectedTab = 0
    @State private var selectedPost: Post? = nil
    let uploadedPosts: [Post]
    let taggedPosts: [Post]
    
    var body: some View {
        VStack {
            Picker("Post Type", selection: $selectedTab) {
                Text("Photos").tag(0)
                Text("Tagged").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            let columns = [
                GridItem(.flexible(), spacing: 2),
                GridItem(.flexible(), spacing: 2),
                GridItem(.flexible(), spacing: 2)
            ]
            
            LazyVGrid(columns: columns, spacing: 2) {
                ForEach(selectedTab == 0 ? uploadedPosts : taggedPosts) { post in
                    PostImageView(imagePath: post.imagePath,
                                size: UIScreen.main.bounds.width / 3 - 1)
                        .clipped()
                        .onTapGesture {
                            selectedPost = post
                        }
                }
            }
            .sheet(item: $selectedPost) { post in
                PostDetailView(post: post)
            }
        }
    }
}