(in /home/rothstar/rails_projects/blog_app)
     post_tags GET    /posts/:post_id/tags(.:format)          {:action=>"index", :controller=>"tags"}
               POST   /posts/:post_id/tags(.:format)          {:action=>"create", :controller=>"tags"}
  new_post_tag GET    /posts/:post_id/tags/new(.:format)      {:action=>"new", :controller=>"tags"}
 edit_post_tag GET    /posts/:post_id/tags/:id/edit(.:format) {:action=>"edit", :controller=>"tags"}
      post_tag GET    /posts/:post_id/tags/:id(.:format)      {:action=>"show", :controller=>"tags"}
               PUT    /posts/:post_id/tags/:id(.:format)      {:action=>"update", :controller=>"tags"}
               DELETE /posts/:post_id/tags/:id(.:format)      {:action=>"destroy", :controller=>"tags"}
         posts GET    /posts(.:format)                        {:action=>"index", :controller=>"posts"}
               POST   /posts(.:format)                        {:action=>"create", :controller=>"posts"}
      new_post GET    /posts/new(.:format)                    {:action=>"new", :controller=>"posts"}
     edit_post GET    /posts/:id/edit(.:format)               {:action=>"edit", :controller=>"posts"}
          post GET    /posts/:id(.:format)                    {:action=>"show", :controller=>"posts"}
               PUT    /posts/:id(.:format)                    {:action=>"update", :controller=>"posts"}
               DELETE /posts/:id(.:format)                    {:action=>"destroy", :controller=>"posts"}
    blog_rolls GET    /blog_rolls(.:format)                   {:action=>"index", :controller=>"blog_rolls"}
               POST   /blog_rolls(.:format)                   {:action=>"create", :controller=>"blog_rolls"}
 new_blog_roll GET    /blog_rolls/new(.:format)               {:action=>"new", :controller=>"blog_rolls"}
edit_blog_roll GET    /blog_rolls/:id/edit(.:format)          {:action=>"edit", :controller=>"blog_rolls"}
     blog_roll GET    /blog_rolls/:id(.:format)               {:action=>"show", :controller=>"blog_rolls"}
               PUT    /blog_rolls/:id(.:format)               {:action=>"update", :controller=>"blog_rolls"}
               DELETE /blog_rolls/:id(.:format)               {:action=>"destroy", :controller=>"blog_rolls"}
         users GET    /users(.:format)                        {:action=>"index", :controller=>"users"}
               POST   /users(.:format)                        {:action=>"create", :controller=>"users"}
      new_user GET    /users/new(.:format)                    {:action=>"new", :controller=>"users"}
     edit_user GET    /users/:id/edit(.:format)               {:action=>"edit", :controller=>"users"}
          user GET    /users/:id(.:format)                    {:action=>"show", :controller=>"users"}
               PUT    /users/:id(.:format)                    {:action=>"update", :controller=>"users"}
               DELETE /users/:id(.:format)                    {:action=>"destroy", :controller=>"users"}
      sessions POST   /sessions(.:format)                     {:action=>"create", :controller=>"sessions"}
       session DELETE /sessions/:id(.:format)                 {:action=>"destroy", :controller=>"sessions"}
   unpublished        /unpublished(.:format)                  {:controller=>"posts", :action=>"unpublished"}
       preview        /preview/:id(.:format)                  {:controller=>"posts", :action=>"preview"}
       publish        /publish/:id(.:format)                  {:controller=>"posts", :action=>"publish"}
     show_tags        /tag_index/:id(.:format)                {:controller=>"posts", :action=>"tag_index"}
   pages_about GET    /pages/about(.:format)                  {:controller=>"pages", :action=>"about"}
 pages_contact GET    /pages/contact(.:format)                {:controller=>"pages", :action=>"contact"}
          root        /(.:format)                             {:controller=>"posts", :action=>"index"}
