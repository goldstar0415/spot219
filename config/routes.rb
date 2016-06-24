# == Route Map
#
#                           Prefix Verb       URI Pattern                                                 Controller#Action
#            conversation_messages GET        /conversations/:conversation_id/messages(.:format)          messages#index
#                                  POST       /conversations/:conversation_id/messages(.:format)          messages#create
#         new_conversation_message GET        /conversations/:conversation_id/messages/new(.:format)      messages#new
#        edit_conversation_message GET        /conversations/:conversation_id/messages/:id/edit(.:format) messages#edit
#             conversation_message GET        /conversations/:conversation_id/messages/:id(.:format)      messages#show
#                                  PATCH      /conversations/:conversation_id/messages/:id(.:format)      messages#update
#                                  PUT        /conversations/:conversation_id/messages/:id(.:format)      messages#update
#                                  DELETE     /conversations/:conversation_id/messages/:id(.:format)      messages#destroy
#                    conversations GET        /conversations(.:format)                                    conversations#index
#                                  POST       /conversations(.:format)                                    conversations#create
#                 new_conversation GET        /conversations/new(.:format)                                conversations#new
#                edit_conversation GET        /conversations/:id/edit(.:format)                           conversations#edit
#                     conversation GET        /conversations/:id(.:format)                                conversations#show
#                                  PATCH      /conversations/:id(.:format)                                conversations#update
#                                  PUT        /conversations/:id(.:format)                                conversations#update
#                                  DELETE     /conversations/:id(.:format)                                conversations#destroy
#                    subscriptions GET        /subscriptions(.:format)                                    subscriptions#index
#                           shoppe            /shoppe                                                     Shoppe::Engine
#                         products GET        /products(.:format)                                         products#index
#                   product_filter GET        /products/filter(.:format)                                  products#filter
#             products_by_category GET        /products/:category_id(.:format)                            products#index
#                          product GET        /products/:category_id/:product_id(.:format)                products#show
#                      buy_product POST       /products/:category_id/:product_id/buy(.:format)            products#add_to_basket
#                     order_status GET        /order/:token(.:format)                                     orders#status
#                            carts GET        /carts(.:format)                                            orders#show
#                     empty_basket DELETE     /carts(.:format)                                            orders#destroy
#      adjust_basket_item_quantity POST       /carts/:order_item_id(.:format)                             orders#change_item_quantity
#                                  DELETE     /carts/:order_item_id(.:format)                             orders#change_item_quantity
#               remove_basket_item DELETE     /carts/delete/:order_item_id(.:format)                      orders#remove_item
#                         checkout GET|PATCH  /checkout(.:format)                                         orders#checkout
#          change_delivery_service POST       /checkout/delivery(.:format)                                orders#change_delivery_service
#                 checkout_payment GET|PATCH  /checkout/pay(.:format)                                     orders#payment
#            checkout_confirmation GET|PATCH  /checkout/confirm(.:format)                                 orders#confirmation
#                  checkout_paypal GET        /checkout/paypal(.:format)                                  orders#paypal
#                            stats GET        /stats(.:format)                                            places#stat
#           new_admin_user_session GET        /admin/login(.:format)                                      active_admin/devise/sessions#new
#               admin_user_session POST       /admin/login(.:format)                                      active_admin/devise/sessions#create
#       destroy_admin_user_session DELETE|GET /admin/logout(.:format)                                     active_admin/devise/sessions#destroy
#              admin_user_password POST       /admin/password(.:format)                                   active_admin/devise/passwords#create
#          new_admin_user_password GET        /admin/password/new(.:format)                               active_admin/devise/passwords#new
#         edit_admin_user_password GET        /admin/password/edit(.:format)                              active_admin/devise/passwords#edit
#                                  PATCH      /admin/password(.:format)                                   active_admin/devise/passwords#update
#                                  PUT        /admin/password(.:format)                                   active_admin/devise/passwords#update
#                 new_user_session GET        /users/sign_in(.:format)                                    devise/sessions#new
#                     user_session POST       /users/sign_in(.:format)                                    devise/sessions#create
#             destroy_user_session DELETE     /users/sign_out(.:format)                                   devise/sessions#destroy
#  user_twitter_omniauth_authorize GET|POST   /users/auth/twitter(.:format)                               devise/omniauth_callbacks#passthru
#   user_twitter_omniauth_callback GET|POST   /users/auth/twitter/callback(.:format)                      devise/omniauth_callbacks#twitter
#   user_google_omniauth_authorize GET|POST   /users/auth/google(.:format)                                devise/omniauth_callbacks#passthru
#    user_google_omniauth_callback GET|POST   /users/auth/google/callback(.:format)                       devise/omniauth_callbacks#google
#                    user_password POST       /users/password(.:format)                                   devise/passwords#create
#                new_user_password GET        /users/password/new(.:format)                               devise/passwords#new
#               edit_user_password GET        /users/password/edit(.:format)                              devise/passwords#edit
#                                  PATCH      /users/password(.:format)                                   devise/passwords#update
#                                  PUT        /users/password(.:format)                                   devise/passwords#update
#         cancel_user_registration GET        /users/cancel(.:format)                                     user/registrations#cancel
#                user_registration POST       /users(.:format)                                            user/registrations#create
#            new_user_registration GET        /users/sign_up(.:format)                                    user/registrations#new
#           edit_user_registration GET        /users/edit(.:format)                                       user/registrations#edit
#                                  PATCH      /users(.:format)                                            user/registrations#update
#                                  PUT        /users(.:format)                                            user/registrations#update
#                                  DELETE     /users(.:format)                                            user/registrations#destroy
#                       admin_root GET        /admin(.:format)                                            admin/dashboard#index
#   batch_action_admin_admin_users POST       /admin/admin_users/batch_action(.:format)                   admin/admin_users#batch_action
#                admin_admin_users GET        /admin/admin_users(.:format)                                admin/admin_users#index
#                                  POST       /admin/admin_users(.:format)                                admin/admin_users#create
#             new_admin_admin_user GET        /admin/admin_users/new(.:format)                            admin/admin_users#new
#            edit_admin_admin_user GET        /admin/admin_users/:id/edit(.:format)                       admin/admin_users#edit
#                 admin_admin_user GET        /admin/admin_users/:id(.:format)                            admin/admin_users#show
#                                  PATCH      /admin/admin_users/:id(.:format)                            admin/admin_users#update
#                                  PUT        /admin/admin_users/:id(.:format)                            admin/admin_users#update
#                                  DELETE     /admin/admin_users/:id(.:format)                            admin/admin_users#destroy
#         batch_action_admin_blogs POST       /admin/blogs/batch_action(.:format)                         admin/blogs#batch_action
#                      admin_blogs GET        /admin/blogs(.:format)                                      admin/blogs#index
#                                  POST       /admin/blogs(.:format)                                      admin/blogs#create
#                   new_admin_blog GET        /admin/blogs/new(.:format)                                  admin/blogs#new
#                  edit_admin_blog GET        /admin/blogs/:id/edit(.:format)                             admin/blogs#edit
#                       admin_blog GET        /admin/blogs/:id(.:format)                                  admin/blogs#show
#                                  PATCH      /admin/blogs/:id(.:format)                                  admin/blogs#update
#                                  PUT        /admin/blogs/:id(.:format)                                  admin/blogs#update
#                                  DELETE     /admin/blogs/:id(.:format)                                  admin/blogs#destroy
#        batch_action_admin_cities POST       /admin/cities/batch_action(.:format)                        admin/cities#batch_action
#                     admin_cities GET        /admin/cities(.:format)                                     admin/cities#index
#                                  POST       /admin/cities(.:format)                                     admin/cities#create
#                   new_admin_city GET        /admin/cities/new(.:format)                                 admin/cities#new
#                  edit_admin_city GET        /admin/cities/:id/edit(.:format)                            admin/cities#edit
#                       admin_city GET        /admin/cities/:id(.:format)                                 admin/cities#show
#                                  PATCH      /admin/cities/:id(.:format)                                 admin/cities#update
#                                  PUT        /admin/cities/:id(.:format)                                 admin/cities#update
#                                  DELETE     /admin/cities/:id(.:format)                                 admin/cities#destroy
#        batch_action_admin_claims POST       /admin/claims/batch_action(.:format)                        admin/claims#batch_action
#                     admin_claims GET        /admin/claims(.:format)                                     admin/claims#index
#                                  POST       /admin/claims(.:format)                                     admin/claims#create
#                  new_admin_claim GET        /admin/claims/new(.:format)                                 admin/claims#new
#                 edit_admin_claim GET        /admin/claims/:id/edit(.:format)                            admin/claims#edit
#                      admin_claim GET        /admin/claims/:id(.:format)                                 admin/claims#show
#                                  PATCH      /admin/claims/:id(.:format)                                 admin/claims#update
#                                  PUT        /admin/claims/:id(.:format)                                 admin/claims#update
#                                  DELETE     /admin/claims/:id(.:format)                                 admin/claims#destroy
#                  admin_dashboard GET        /admin/dashboard(.:format)                                  admin/dashboard#index
#      batch_action_admin_features POST       /admin/features/batch_action(.:format)                      admin/features#batch_action
#                   admin_features GET        /admin/features(.:format)                                   admin/features#index
#                                  POST       /admin/features(.:format)                                   admin/features#create
#                new_admin_feature GET        /admin/features/new(.:format)                               admin/features#new
#               edit_admin_feature GET        /admin/features/:id/edit(.:format)                          admin/features#edit
#                    admin_feature GET        /admin/features/:id(.:format)                               admin/features#show
#                                  PATCH      /admin/features/:id(.:format)                               admin/features#update
#                                  PUT        /admin/features/:id(.:format)                               admin/features#update
#                                  DELETE     /admin/features/:id(.:format)                               admin/features#destroy
# batch_action_admin_notifications POST       /admin/notifications/batch_action(.:format)                 admin/notifications#batch_action
#              admin_notifications GET        /admin/notifications(.:format)                              admin/notifications#index
#                                  POST       /admin/notifications(.:format)                              admin/notifications#create
#           new_admin_notification GET        /admin/notifications/new(.:format)                          admin/notifications#new
#          edit_admin_notification GET        /admin/notifications/:id/edit(.:format)                     admin/notifications#edit
#               admin_notification GET        /admin/notifications/:id(.:format)                          admin/notifications#show
#                                  PATCH      /admin/notifications/:id(.:format)                          admin/notifications#update
#                                  PUT        /admin/notifications/:id(.:format)                          admin/notifications#update
#                                  DELETE     /admin/notifications/:id(.:format)                          admin/notifications#destroy
#        batch_action_admin_places POST       /admin/places/batch_action(.:format)                        admin/places#batch_action
#                     admin_places GET        /admin/places(.:format)                                     admin/places#index
#                                  POST       /admin/places(.:format)                                     admin/places#create
#                  new_admin_place GET        /admin/places/new(.:format)                                 admin/places#new
#                 edit_admin_place GET        /admin/places/:id/edit(.:format)                            admin/places#edit
#                      admin_place GET        /admin/places/:id(.:format)                                 admin/places#show
#                                  PATCH      /admin/places/:id(.:format)                                 admin/places#update
#                                  PUT        /admin/places/:id(.:format)                                 admin/places#update
#                                  DELETE     /admin/places/:id(.:format)                                 admin/places#destroy
# batch_action_admin_subscriptions POST       /admin/subscriptions/batch_action(.:format)                 admin/subscriptions#batch_action
#              admin_subscriptions GET        /admin/subscriptions(.:format)                              admin/subscriptions#index
#                                  POST       /admin/subscriptions(.:format)                              admin/subscriptions#create
#           new_admin_subscription GET        /admin/subscriptions/new(.:format)                          admin/subscriptions#new
#          edit_admin_subscription GET        /admin/subscriptions/:id/edit(.:format)                     admin/subscriptions#edit
#               admin_subscription GET        /admin/subscriptions/:id(.:format)                          admin/subscriptions#show
#                                  PATCH      /admin/subscriptions/:id(.:format)                          admin/subscriptions#update
#                                  PUT        /admin/subscriptions/:id(.:format)                          admin/subscriptions#update
#                                  DELETE     /admin/subscriptions/:id(.:format)                          admin/subscriptions#destroy
#         batch_action_admin_users POST       /admin/users/batch_action(.:format)                         admin/users#batch_action
#                      admin_users GET        /admin/users(.:format)                                      admin/users#index
#                                  POST       /admin/users(.:format)                                      admin/users#create
#                   new_admin_user GET        /admin/users/new(.:format)                                  admin/users#new
#                  edit_admin_user GET        /admin/users/:id/edit(.:format)                             admin/users#edit
#                       admin_user GET        /admin/users/:id(.:format)                                  admin/users#show
#                                  PATCH      /admin/users/:id(.:format)                                  admin/users#update
#                                  PUT        /admin/users/:id(.:format)                                  admin/users#update
#                                  DELETE     /admin/users/:id(.:format)                                  admin/users#destroy
#                   admin_comments GET        /admin/comments(.:format)                                   admin/comments#index
#                                  POST       /admin/comments(.:format)                                   admin/comments#create
#                    admin_comment GET        /admin/comments/:id(.:format)                               admin/comments#show
#                                  DELETE     /admin/comments/:id(.:format)                               admin/comments#destroy
#                             rate POST       /rate(.:format)                                             rater#create
#                  location_cities POST       /cities/location(.:format)                                  cities#location
#                           cities GET        /cities(.:format)                                           cities#index
#                                  POST       /cities(.:format)                                           cities#create
#                         new_city GET        /cities/new(.:format)                                       cities#new
#                        edit_city GET        /cities/:id/edit(.:format)                                  cities#edit
#                             city GET        /cities/:id(.:format)                                       cities#show
#                                  PATCH      /cities/:id(.:format)                                       cities#update
#                                  PUT        /cities/:id(.:format)                                       cities#update
#                                  DELETE     /cities/:id(.:format)                                       cities#destroy
#   paypal_callback_shopping_carts GET        /shopping_carts/paypal_callback(.:format)                   shopping_carts#paypal_callback
#          checkout_shopping_carts POST       /shopping_carts/checkout(.:format)                          shopping_carts#checkout
#        remove_item_shopping_cart DELETE     /shopping_carts/:id/remove_item(.:format)                   shopping_carts#remove_item
#                   shopping_carts GET        /shopping_carts(.:format)                                   shopping_carts#index
#                                  POST       /shopping_carts(.:format)                                   shopping_carts#create
#                new_shopping_cart GET        /shopping_carts/new(.:format)                               shopping_carts#new
#               edit_shopping_cart GET        /shopping_carts/:id/edit(.:format)                          shopping_carts#edit
#                    shopping_cart GET        /shopping_carts/:id(.:format)                               shopping_carts#show
#                                  PATCH      /shopping_carts/:id(.:format)                               shopping_carts#update
#                                  PUT        /shopping_carts/:id(.:format)                               shopping_carts#update
#                                  DELETE     /shopping_carts/:id(.:format)                               shopping_carts#destroy
#                           claims GET        /claims(.:format)                                           claims#index
#                                  POST       /claims(.:format)                                           claims#create
#                        new_claim GET        /claims/new(.:format)                                       claims#new
#                       edit_claim GET        /claims/:id/edit(.:format)                                  claims#edit
#                            claim GET        /claims/:id(.:format)                                       claims#show
#                                  PATCH      /claims/:id(.:format)                                       claims#update
#                                  PUT        /claims/:id(.:format)                                       claims#update
#                                  DELETE     /claims/:id(.:format)                                       claims#destroy
#                    blog_comments GET        /blog_comments(.:format)                                    blog_comments#index
#                                  POST       /blog_comments(.:format)                                    blog_comments#create
#                 new_blog_comment GET        /blog_comments/new(.:format)                                blog_comments#new
#                edit_blog_comment GET        /blog_comments/:id/edit(.:format)                           blog_comments#edit
#                     blog_comment GET        /blog_comments/:id(.:format)                                blog_comments#show
#                                  PATCH      /blog_comments/:id(.:format)                                blog_comments#update
#                                  PUT        /blog_comments/:id(.:format)                                blog_comments#update
#                                  DELETE     /blog_comments/:id(.:format)                                blog_comments#destroy
#                            blogs GET        /blogs(.:format)                                            blogs#index
#                                  POST       /blogs(.:format)                                            blogs#create
#                         new_blog GET        /blogs/new(.:format)                                        blogs#new
#                        edit_blog GET        /blogs/:id/edit(.:format)                                   blogs#edit
#                             blog GET        /blogs/:id(.:format)                                        blogs#show
#                                  PATCH      /blogs/:id(.:format)                                        blogs#update
#                                  PUT        /blogs/:id(.:format)                                        blogs#update
#                                  DELETE     /blogs/:id(.:format)                                        blogs#destroy
#                      friendships GET        /friendships(.:format)                                      friendships#index
#                                  POST       /friendships(.:format)                                      friendships#create
#                   new_friendship GET        /friendships/new(.:format)                                  friendships#new
#                  edit_friendship GET        /friendships/:id/edit(.:format)                             friendships#edit
#                       friendship GET        /friendships/:id(.:format)                                  friendships#show
#                                  PATCH      /friendships/:id(.:format)                                  friendships#update
#                                  PUT        /friendships/:id(.:format)                                  friendships#update
#                                  DELETE     /friendships/:id(.:format)                                  friendships#destroy
#                          sliders GET        /sliders(.:format)                                          sliders#index
#                                  POST       /sliders(.:format)                                          sliders#create
#                       new_slider GET        /sliders/new(.:format)                                      sliders#new
#                      edit_slider GET        /sliders/:id/edit(.:format)                                 sliders#edit
#                           slider GET        /sliders/:id(.:format)                                      sliders#show
#                                  PATCH      /sliders/:id(.:format)                                      sliders#update
#                                  PUT        /sliders/:id(.:format)                                      sliders#update
#                                  DELETE     /sliders/:id(.:format)                                      sliders#destroy
#                        campaigns GET        /campaigns(.:format)                                        campaigns#index
#                                  POST       /campaigns(.:format)                                        campaigns#create
#                     new_campaign GET        /campaigns/new(.:format)                                    campaigns#new
#                    edit_campaign GET        /campaigns/:id/edit(.:format)                               campaigns#edit
#                         campaign GET        /campaigns/:id(.:format)                                    campaigns#show
#                                  PATCH      /campaigns/:id(.:format)                                    campaigns#update
#                                  PUT        /campaigns/:id(.:format)                                    campaigns#update
#                                  DELETE     /campaigns/:id(.:format)                                    campaigns#destroy
#                         comments GET        /comments(.:format)                                         comments#index
#                                  POST       /comments(.:format)                                         comments#create
#                      new_comment GET        /comments/new(.:format)                                     comments#new
#                     edit_comment GET        /comments/:id/edit(.:format)                                comments#edit
#                          comment GET        /comments/:id(.:format)                                     comments#show
#                                  PATCH      /comments/:id(.:format)                                     comments#update
#                                  PUT        /comments/:id(.:format)                                     comments#update
#                                  DELETE     /comments/:id(.:format)                                     comments#destroy
#                      stat_places GET        /places/stat(.:format)                                      places#stat
#                           places GET        /places(.:format)                                           places#index
#                                  POST       /places(.:format)                                           places#create
#                        new_place GET        /places/new(.:format)                                       places#new
#                       edit_place GET        /places/:id/edit(.:format)                                  places#edit
#                            place GET        /places/:id(.:format)                                       places#show
#                                  PATCH      /places/:id(.:format)                                       places#update
#                                  PUT        /places/:id(.:format)                                       places#update
#                                  DELETE     /places/:id(.:format)                                       places#destroy
#                             user GET        /users/:id(.:format)                                        users#show
#                   search_friends GET        /search_friends(.:format)                                   users#search
#                       add_friend POST       /add_friend(.:format)                                       users#add_friend
#                       categories GET        /categories(.:format)                                       categories#index
#                                  POST       /categories(.:format)                                       categories#create
#                     new_category GET        /categories/new(.:format)                                   categories#new
#                    edit_category GET        /categories/:id/edit(.:format)                              categories#edit
#                         category GET        /categories/:id(.:format)                                   categories#show
#                                  PATCH      /categories/:id(.:format)                                   categories#update
#                                  PUT        /categories/:id(.:format)                                   categories#update
#                   place_comments GET        /places/:place_id/comments(.:format)                        comments#index
#                                  POST       /places/:place_id/comments(.:format)                        comments#create
#                new_place_comment GET        /places/:place_id/comments/new(.:format)                    comments#new
#               edit_place_comment GET        /places/:place_id/comments/:id/edit(.:format)               comments#edit
#                    place_comment GET        /places/:place_id/comments/:id(.:format)                    comments#show
#                                  PATCH      /places/:place_id/comments/:id(.:format)                    comments#update
#                                  PUT        /places/:place_id/comments/:id(.:format)                    comments#update
#                                  DELETE     /places/:place_id/comments/:id(.:format)                    comments#destroy
#                                  GET        /places(.:format)                                           places#index
#                                  POST       /places(.:format)                                           places#create
#                                  GET        /places/new(.:format)                                       places#new
#                                  GET        /places/:id/edit(.:format)                                  places#edit
#                                  GET        /places/:id(.:format)                                       places#show
#                                  PATCH      /places/:id(.:format)                                       places#update
#                                  PUT        /places/:id(.:format)                                       places#update
#                                  DELETE     /places/:id(.:format)                                       places#destroy
#               blog_blog_comments GET        /blogs/:blog_id/blog_comments(.:format)                     blog_comments#index
#                                  POST       /blogs/:blog_id/blog_comments(.:format)                     blog_comments#create
#            new_blog_blog_comment GET        /blogs/:blog_id/blog_comments/new(.:format)                 blog_comments#new
#           edit_blog_blog_comment GET        /blogs/:blog_id/blog_comments/:id/edit(.:format)            blog_comments#edit
#                blog_blog_comment GET        /blogs/:blog_id/blog_comments/:id(.:format)                 blog_comments#show
#                                  PATCH      /blogs/:blog_id/blog_comments/:id(.:format)                 blog_comments#update
#                                  PUT        /blogs/:blog_id/blog_comments/:id(.:format)                 blog_comments#update
#                                  DELETE     /blogs/:blog_id/blog_comments/:id(.:format)                 blog_comments#destroy
#                                  GET        /blogs(.:format)                                            blogs#index
#                                  POST       /blogs(.:format)                                            blogs#create
#                                  GET        /blogs/new(.:format)                                        blogs#new
#                                  GET        /blogs/:id/edit(.:format)                                   blogs#edit
#                                  GET        /blogs/:id(.:format)                                        blogs#show
#                                  PATCH      /blogs/:id(.:format)                                        blogs#update
#                                  PUT        /blogs/:id(.:format)                                        blogs#update
#                                  DELETE     /blogs/:id(.:format)                                        blogs#destroy
#                           search GET        /search(.:format)                                           places#search
#                       my_profile GET        /my_profile(.:format)                                       users#my_profile
#                       my_friends GET        /my_friends(.:format)                                       users#my_friends
#                        my_places GET        /my-places(.:format)                                        users#my_places
#                             page GET        /:action(.:format)                                          pages#:action
#                             root GET        /                                                           places#index
#
# Routes for Shoppe::Engine:
#                                              GET      /attachment/:id/:filename.:extension(.:format)                                     shoppe/attachments#show
#                             search_customers POST     /customers/search(.:format)                                                        shoppe/customers#search
#                           customer_addresses GET      /customers/:customer_id/addresses(.:format)                                        shoppe/addresses#index
#                                              POST     /customers/:customer_id/addresses(.:format)                                        shoppe/addresses#create
#                         new_customer_address GET      /customers/:customer_id/addresses/new(.:format)                                    shoppe/addresses#new
#                        edit_customer_address GET      /customers/:customer_id/addresses/:id/edit(.:format)                               shoppe/addresses#edit
#                             customer_address GET      /customers/:customer_id/addresses/:id(.:format)                                    shoppe/addresses#show
#                                              PATCH    /customers/:customer_id/addresses/:id(.:format)                                    shoppe/addresses#update
#                                              PUT      /customers/:customer_id/addresses/:id(.:format)                                    shoppe/addresses#update
#                                              DELETE   /customers/:customer_id/addresses/:id(.:format)                                    shoppe/addresses#destroy
#                                    customers GET      /customers(.:format)                                                               shoppe/customers#index
#                                              POST     /customers(.:format)                                                               shoppe/customers#create
#                                 new_customer GET      /customers/new(.:format)                                                           shoppe/customers#new
#                                edit_customer GET      /customers/:id/edit(.:format)                                                      shoppe/customers#edit
#                                     customer GET      /customers/:id(.:format)                                                           shoppe/customers#show
#                                              PATCH    /customers/:id(.:format)                                                           shoppe/customers#update
#                                              PUT      /customers/:id(.:format)                                                           shoppe/customers#update
#                                              DELETE   /customers/:id(.:format)                                                           shoppe/customers#destroy
#               product_category_localisations GET      /product_categories/:product_category_id/localisations(.:format)                   shoppe/product_category_localisations#index
#                                              POST     /product_categories/:product_category_id/localisations(.:format)                   shoppe/product_category_localisations#create
#            new_product_category_localisation GET      /product_categories/:product_category_id/localisations/new(.:format)               shoppe/product_category_localisations#new
#           edit_product_category_localisation GET      /product_categories/:product_category_id/localisations/:id/edit(.:format)          shoppe/product_category_localisations#edit
#                product_category_localisation GET      /product_categories/:product_category_id/localisations/:id(.:format)               shoppe/product_category_localisations#show
#                                              PATCH    /product_categories/:product_category_id/localisations/:id(.:format)               shoppe/product_category_localisations#update
#                                              PUT      /product_categories/:product_category_id/localisations/:id(.:format)               shoppe/product_category_localisations#update
#                                              DELETE   /product_categories/:product_category_id/localisations/:id(.:format)               shoppe/product_category_localisations#destroy
#                           product_categories GET      /product_categories(.:format)                                                      shoppe/product_categories#index
#                                              POST     /product_categories(.:format)                                                      shoppe/product_categories#create
#                         new_product_category GET      /product_categories/new(.:format)                                                  shoppe/product_categories#new
#                        edit_product_category GET      /product_categories/:id/edit(.:format)                                             shoppe/product_categories#edit
#                             product_category GET      /product_categories/:id(.:format)                                                  shoppe/product_categories#show
#                                              PATCH    /product_categories/:id(.:format)                                                  shoppe/product_categories#update
#                                              PUT      /product_categories/:id(.:format)                                                  shoppe/product_categories#update
#                                              DELETE   /product_categories/:id(.:format)                                                  shoppe/product_categories#destroy
#                             product_variants GET      /products/:product_id/variants(.:format)                                           shoppe/variants#index
#                                              POST     /products/:product_id/variants(.:format)                                           shoppe/variants#create
#                          new_product_variant GET      /products/:product_id/variants/new(.:format)                                       shoppe/variants#new
#                         edit_product_variant GET      /products/:product_id/variants/:id/edit(.:format)                                  shoppe/variants#edit
#                              product_variant GET      /products/:product_id/variants/:id(.:format)                                       shoppe/variants#show
#                                              PATCH    /products/:product_id/variants/:id(.:format)                                       shoppe/variants#update
#                                              PUT      /products/:product_id/variants/:id(.:format)                                       shoppe/variants#update
#                                              DELETE   /products/:product_id/variants/:id(.:format)                                       shoppe/variants#destroy
#                        product_localisations GET      /products/:product_id/localisations(.:format)                                      shoppe/product_localisations#index
#                                              POST     /products/:product_id/localisations(.:format)                                      shoppe/product_localisations#create
#                     new_product_localisation GET      /products/:product_id/localisations/new(.:format)                                  shoppe/product_localisations#new
#                    edit_product_localisation GET      /products/:product_id/localisations/:id/edit(.:format)                             shoppe/product_localisations#edit
#                         product_localisation GET      /products/:product_id/localisations/:id(.:format)                                  shoppe/product_localisations#show
#                                              PATCH    /products/:product_id/localisations/:id(.:format)                                  shoppe/product_localisations#update
#                                              PUT      /products/:product_id/localisations/:id(.:format)                                  shoppe/product_localisations#update
#                                              DELETE   /products/:product_id/localisations/:id(.:format)                                  shoppe/product_localisations#destroy
#                              import_products GET      /products/import(.:format)                                                         shoppe/products#import
#                                              POST     /products/import(.:format)                                                         shoppe/products#import
#                                     products GET      /products(.:format)                                                                shoppe/products#index
#                                              POST     /products(.:format)                                                                shoppe/products#create
#                                  new_product GET      /products/new(.:format)                                                            shoppe/products#new
#                                 edit_product GET      /products/:id/edit(.:format)                                                       shoppe/products#edit
#                                      product GET      /products/:id(.:format)                                                            shoppe/products#show
#                                              PATCH    /products/:id(.:format)                                                            shoppe/products#update
#                                              PUT      /products/:id(.:format)                                                            shoppe/products#update
#                                              DELETE   /products/:id(.:format)                                                            shoppe/products#destroy
#                                search_orders POST     /orders/search(.:format)                                                           shoppe/orders#search
#                                 accept_order POST     /orders/:id/accept(.:format)                                                       shoppe/orders#accept
#                                 reject_order POST     /orders/:id/reject(.:format)                                                       shoppe/orders#reject
#                                   ship_order POST     /orders/:id/ship(.:format)                                                         shoppe/orders#ship
#                          despatch_note_order GET      /orders/:id/despatch_note(.:format)                                                shoppe/orders#despatch_note
#                         refund_order_payment GET|POST /orders/:order_id/payments/:id/refund(.:format)                                    shoppe/payments#refund
#                               order_payments POST     /orders/:order_id/payments(.:format)                                               shoppe/payments#create
#                                order_payment DELETE   /orders/:order_id/payments/:id(.:format)                                           shoppe/payments#destroy
#                                       orders GET      /orders(.:format)                                                                  shoppe/orders#index
#                                              POST     /orders(.:format)                                                                  shoppe/orders#create
#                                    new_order GET      /orders/new(.:format)                                                              shoppe/orders#new
#                                   edit_order GET      /orders/:id/edit(.:format)                                                         shoppe/orders#edit
#                                        order GET      /orders/:id(.:format)                                                              shoppe/orders#show
#                                              PATCH    /orders/:id(.:format)                                                              shoppe/orders#update
#                                              PUT      /orders/:id(.:format)                                                              shoppe/orders#update
#                                              DELETE   /orders/:id(.:format)                                                              shoppe/orders#destroy
#                      stock_level_adjustments GET      /stock_level_adjustments(.:format)                                                 shoppe/stock_level_adjustments#index
#                                              POST     /stock_level_adjustments(.:format)                                                 shoppe/stock_level_adjustments#create
#     delivery_service_delivery_service_prices GET      /delivery_services/:delivery_service_id/delivery_service_prices(.:format)          shoppe/delivery_service_prices#index
#                                              POST     /delivery_services/:delivery_service_id/delivery_service_prices(.:format)          shoppe/delivery_service_prices#create
#  new_delivery_service_delivery_service_price GET      /delivery_services/:delivery_service_id/delivery_service_prices/new(.:format)      shoppe/delivery_service_prices#new
# edit_delivery_service_delivery_service_price GET      /delivery_services/:delivery_service_id/delivery_service_prices/:id/edit(.:format) shoppe/delivery_service_prices#edit
#      delivery_service_delivery_service_price GET      /delivery_services/:delivery_service_id/delivery_service_prices/:id(.:format)      shoppe/delivery_service_prices#show
#                                              PATCH    /delivery_services/:delivery_service_id/delivery_service_prices/:id(.:format)      shoppe/delivery_service_prices#update
#                                              PUT      /delivery_services/:delivery_service_id/delivery_service_prices/:id(.:format)      shoppe/delivery_service_prices#update
#                                              DELETE   /delivery_services/:delivery_service_id/delivery_service_prices/:id(.:format)      shoppe/delivery_service_prices#destroy
#                            delivery_services GET      /delivery_services(.:format)                                                       shoppe/delivery_services#index
#                                              POST     /delivery_services(.:format)                                                       shoppe/delivery_services#create
#                         new_delivery_service GET      /delivery_services/new(.:format)                                                   shoppe/delivery_services#new
#                        edit_delivery_service GET      /delivery_services/:id/edit(.:format)                                              shoppe/delivery_services#edit
#                             delivery_service GET      /delivery_services/:id(.:format)                                                   shoppe/delivery_services#show
#                                              PATCH    /delivery_services/:id(.:format)                                                   shoppe/delivery_services#update
#                                              PUT      /delivery_services/:id(.:format)                                                   shoppe/delivery_services#update
#                                              DELETE   /delivery_services/:id(.:format)                                                   shoppe/delivery_services#destroy
#                                    tax_rates GET      /tax_rates(.:format)                                                               shoppe/tax_rates#index
#                                              POST     /tax_rates(.:format)                                                               shoppe/tax_rates#create
#                                 new_tax_rate GET      /tax_rates/new(.:format)                                                           shoppe/tax_rates#new
#                                edit_tax_rate GET      /tax_rates/:id/edit(.:format)                                                      shoppe/tax_rates#edit
#                                     tax_rate GET      /tax_rates/:id(.:format)                                                           shoppe/tax_rates#show
#                                              PATCH    /tax_rates/:id(.:format)                                                           shoppe/tax_rates#update
#                                              PUT      /tax_rates/:id(.:format)                                                           shoppe/tax_rates#update
#                                              DELETE   /tax_rates/:id(.:format)                                                           shoppe/tax_rates#destroy
#                                        users GET      /users(.:format)                                                                   shoppe/users#index
#                                              POST     /users(.:format)                                                                   shoppe/users#create
#                                     new_user GET      /users/new(.:format)                                                               shoppe/users#new
#                                    edit_user GET      /users/:id/edit(.:format)                                                          shoppe/users#edit
#                                         user GET      /users/:id(.:format)                                                               shoppe/users#show
#                                              PATCH    /users/:id(.:format)                                                               shoppe/users#update
#                                              PUT      /users/:id(.:format)                                                               shoppe/users#update
#                                              DELETE   /users/:id(.:format)                                                               shoppe/users#destroy
#                                    countries GET      /countries(.:format)                                                               shoppe/countries#index
#                                              POST     /countries(.:format)                                                               shoppe/countries#create
#                                  new_country GET      /countries/new(.:format)                                                           shoppe/countries#new
#                                 edit_country GET      /countries/:id/edit(.:format)                                                      shoppe/countries#edit
#                                      country GET      /countries/:id(.:format)                                                           shoppe/countries#show
#                                              PATCH    /countries/:id(.:format)                                                           shoppe/countries#update
#                                              PUT      /countries/:id(.:format)                                                           shoppe/countries#update
#                                              DELETE   /countries/:id(.:format)                                                           shoppe/countries#destroy
#                                   attachment DELETE   /attachments/:id(.:format)                                                         shoppe/attachments#destroy
#                                     settings GET      /settings(.:format)                                                                shoppe/settings#edit
#                                              POST     /settings(.:format)                                                                shoppe/settings#update
#                                        login GET      /login(.:format)                                                                   shoppe/sessions#new
#                                              POST     /login(.:format)                                                                   shoppe/sessions#create
#                                  login_reset GET|POST /login/reset(.:format)                                                             shoppe/sessions#reset
#                                       logout DELETE   /logout(.:format)                                                                  shoppe/sessions#destroy
#                                         root GET      /                                                                                  shoppe/dashboard#home
#

Rails.application.routes.draw do

  resources :conversations do
    resources :messages
  end

  resources :subscriptions, only: :index

  #
  # Shoppe admin interface
  #
  mount Shoppe::Engine => "/shoppe"

  #
  # Product browising
  #
  get "products", to: "products#index", :as => 'products'
  #get 'products' => 'products#categories', :as => 'catalogue'
  get 'products/filter' => 'products#filter', :as => 'product_filter'
  get 'products/:category_id' => 'products#index', :as => 'products_by_category'
  get 'products/:category_id/:product_id' => 'products#show', :as => 'product'
  post 'products/:category_id/:product_id/buy' => 'products#add_to_basket', :as => 'buy_product'

  #
  # Order status
  #
  get 'order/:token' => 'orders#status', :as => 'order_status'

  #
  # Basket
  #
  get 'carts' => 'orders#show', :as => 'carts'
  delete 'carts' => 'orders#destroy', :as => 'empty_basket'
  post 'carts/:order_item_id' => 'orders#change_item_quantity', :as => 'adjust_basket_item_quantity'
  delete 'carts/:order_item_id' => 'orders#change_item_quantity'
  delete 'carts/delete/:order_item_id' => 'orders#remove_item', :as => 'remove_basket_item'

  #
  # Checkout
  #
  match 'checkout' => 'orders#checkout', :as => 'checkout', :via => [:get, :patch]
  match 'checkout/delivery' => 'orders#change_delivery_service', :as => 'change_delivery_service', :via => [:post]
  match 'checkout/pay' => 'orders#payment', :as => 'checkout_payment', :via => [:get, :patch]
  match 'checkout/confirm' => 'orders#confirmation', :as => 'checkout_confirmation', :via => [:get, :patch]
  #
  # Paypal
  #
  get "checkout/paypal", to: "orders#paypal"
  get 'stats' => 'places#stat', as: :stats
###################################################
  devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: {
    registrations: "user/registrations"
  }

  ActiveAdmin.routes(self)

  post '/rate' => 'rater#create', as: 'rate'

  resources :cities do
    post :location, on: :collection
  end

  resources :shopping_carts do
    collection do
      get :paypal_callback
      post :checkout
    end

    member do
      delete :remove_item
    end
  end

  resources :claims, :blog_comments, :blogs, :friendships, :sliders, :campaigns, :comments

  resources :places do
    get :stat, on: :collection
  end

  resources :users, only: [:show]

  get 'search_friends', to: 'users#search'
  post 'add_friend', to: 'users#add_friend'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  resources :categories, except: [:destroy]

  resources :places do
    resources :comments
  end

  resources :blogs do
    resources :blog_comments
  end

  get 'search', to: "places#search"
  get 'my_profile', to: "users#my_profile"
  get 'my_friends', to: 'users#my_friends'
  get 'my-places', to: 'users#my_places'

  # Static pages
  #
  get ':action', controller: 'pages', as: 'page'
  root 'places#index'
end
