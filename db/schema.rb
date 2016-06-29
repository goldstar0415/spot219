# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160629203946) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "average_caches", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "avg",           null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "billing_addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "line"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "blog_comments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "blog_id"
    t.integer  "number"
  end

  create_table "blogs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "user_id"
    t.string   "description"
    t.integer  "city_id"
    t.integer  "impressions_count", default: 0
    t.string   "image"
    t.string   "slug"
  end

  create_table "campaigns", force: :cascade do |t|
    t.float    "budget"
    t.string   "name"
    t.integer  "user_id"
    t.boolean  "running"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  create_table "cities", force: :cascade do |t|
    t.text     "about"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.float    "lng"
    t.float    "lat"
    t.float    "radius"
    t.string   "image"
    t.string   "slug"
    t.float    "distance"
    t.integer  "country_id"
  end

  add_index "cities", ["slug"], name: "index_cities_on_slug", unique: true, using: :btree

  create_table "claims", force: :cascade do |t|
    t.string   "email",      default: "", null: false
    t.string   "first_name", default: ""
    t.string   "last_name",  default: ""
    t.string   "proof"
    t.string   "phone"
    t.text     "reason"
    t.integer  "status"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "rating"
  end

  create_table "commontator_comments", force: :cascade do |t|
    t.string   "creator_type"
    t.integer  "creator_id"
    t.string   "editor_type"
    t.integer  "editor_id"
    t.integer  "thread_id",                     null: false
    t.text     "body",                          null: false
    t.datetime "deleted_at"
    t.integer  "cached_votes_up",   default: 0
    t.integer  "cached_votes_down", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_comments", ["cached_votes_down"], name: "index_commontator_comments_on_cached_votes_down", using: :btree
  add_index "commontator_comments", ["cached_votes_up"], name: "index_commontator_comments_on_cached_votes_up", using: :btree
  add_index "commontator_comments", ["creator_id", "creator_type", "thread_id"], name: "index_commontator_comments_on_c_id_and_c_type_and_t_id", using: :btree
  add_index "commontator_comments", ["thread_id", "created_at"], name: "index_commontator_comments_on_thread_id_and_created_at", using: :btree

  create_table "commontator_subscriptions", force: :cascade do |t|
    t.string   "subscriber_type", null: false
    t.integer  "subscriber_id",   null: false
    t.integer  "thread_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_subscriptions", ["subscriber_id", "subscriber_type", "thread_id"], name: "index_commontator_subscriptions_on_s_id_and_s_type_and_t_id", unique: true, using: :btree
  add_index "commontator_subscriptions", ["thread_id"], name: "index_commontator_subscriptions_on_thread_id", using: :btree

  create_table "commontator_threads", force: :cascade do |t|
    t.string   "commontable_type"
    t.integer  "commontable_id"
    t.datetime "closed_at"
    t.string   "closer_type"
    t.integer  "closer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "commontator_threads", ["commontable_id", "commontable_type"], name: "index_commontator_threads_on_c_id_and_c_type", unique: true, using: :btree

  create_table "compaigns", force: :cascade do |t|
    t.float    "budget"
    t.integer  "user_id"
    t.boolean  "running"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.float    "lat"
    t.float    "lng"
    t.float    "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "delivery_addresses", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "line"
    t.string   "city"
    t.string   "country"
    t.string   "postcode"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.string "slug"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "friendships", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "impressions", force: :cascade do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "nifty_key_value_store", force: :cascade do |t|
    t.integer "parent_id"
    t.string  "parent_type"
    t.string  "group"
    t.string  "name"
    t.string  "value"
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "open_days", force: :cascade do |t|
    t.integer "place_id"
    t.string  "day_in_week"
    t.time    "start_time"
    t.time    "end_time"
  end

  create_table "order_details", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "place_id"
    t.integer  "quantity",                           default: 0
    t.decimal  "price",      precision: 8, scale: 2, default: 0.0
    t.decimal  "tax",        precision: 8, scale: 2, default: 0.0
    t.decimal  "sub_total",  precision: 8, scale: 2, default: 0.0
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "order_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "day_delivery",                                default: 0
    t.decimal  "price_delivery",      precision: 8, scale: 2, default: 0.0
    t.integer  "total_item",                                  default: 0
    t.decimal  "total_excluding_tax", precision: 8, scale: 2, default: 0.0
    t.decimal  "total_price",         precision: 8, scale: 2, default: 0.0
    t.decimal  "tax",                 precision: 8, scale: 2, default: 0.0
    t.integer  "order_info_id"
    t.integer  "billing_address_id"
    t.integer  "delivery_address_id"
    t.integer  "status",                                      default: 0
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
  end

  create_table "overall_averages", force: :cascade do |t|
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "overall_avg",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "place_categories", force: :cascade do |t|
    t.integer "place_id"
    t.integer "category_id"
  end

  create_table "place_views", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "featured"
  end

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.text     "about"
    t.string   "address"
    t.string   "phone"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "web"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "city_id"
    t.float    "lat"
    t.float    "lng"
    t.string   "tagline"
    t.string   "slug"
    t.boolean  "featured",          default: false
    t.string   "image"
    t.integer  "impressions_count", default: 0
  end

  add_index "places", ["slug"], name: "index_places_on_slug", unique: true, using: :btree

  create_table "rates", force: :cascade do |t|
    t.integer  "rater_id"
    t.integer  "rateable_id"
    t.string   "rateable_type"
    t.float    "stars",         null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rates", ["rateable_id", "rateable_type"], name: "index_rates_on_rateable_id_and_rateable_type", using: :btree
  add_index "rates", ["rater_id"], name: "index_rates_on_rater_id", using: :btree

  create_table "rating_caches", force: :cascade do |t|
    t.integer  "cacheable_id"
    t.string   "cacheable_type"
    t.float    "avg",            null: false
    t.integer  "qty",            null: false
    t.string   "dimension"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rating_caches", ["cacheable_id", "cacheable_type"], name: "index_rating_caches_on_cacheable_id_and_cacheable_type", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "search_logs", force: :cascade do |t|
    t.string   "keyword"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shoppe_addresses", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "address_type"
    t.boolean  "default"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "address4"
    t.string   "postcode"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_addresses", ["customer_id"], name: "index_shoppe_addresses_on_customer_id", using: :btree

  create_table "shoppe_attachments", force: :cascade do |t|
    t.integer  "parent_id",   null: false
    t.string   "parent_type", null: false
    t.string   "token"
    t.string   "file",        null: false
    t.string   "file_name"
    t.integer  "file_size"
    t.string   "file_type"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_countries", force: :cascade do |t|
    t.string  "name"
    t.string  "code2"
    t.string  "code3"
    t.string  "continent"
    t.string  "tld"
    t.string  "currency"
    t.boolean "eu_member", default: false
  end

  create_table "shoppe_customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.string   "mobile"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shoppe_delivery_service_prices", force: :cascade do |t|
    t.integer  "delivery_service_id"
    t.string   "code"
    t.decimal  "price",               precision: 8, scale: 2
    t.decimal  "cost_price",          precision: 8, scale: 2
    t.integer  "tax_rate_id"
    t.decimal  "min_weight",          precision: 8, scale: 2
    t.decimal  "max_weight",          precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
  end

  add_index "shoppe_delivery_service_prices", ["delivery_service_id"], name: "index_shoppe_delivery_service_prices_on_delivery_service_id", using: :btree
  add_index "shoppe_delivery_service_prices", ["max_weight"], name: "index_shoppe_delivery_service_prices_on_max_weight", using: :btree
  add_index "shoppe_delivery_service_prices", ["min_weight"], name: "index_shoppe_delivery_service_prices_on_min_weight", using: :btree
  add_index "shoppe_delivery_service_prices", ["price"], name: "index_shoppe_delivery_service_prices_on_price", using: :btree

  create_table "shoppe_delivery_services", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.boolean  "default",      default: false
    t.boolean  "active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "courier"
    t.string   "tracking_url"
  end

  add_index "shoppe_delivery_services", ["active"], name: "index_shoppe_delivery_services_on_active", using: :btree

  create_table "shoppe_order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "ordered_item_id"
    t.string   "ordered_item_type"
    t.integer  "quantity",                                  default: 1
    t.decimal  "unit_price",        precision: 8, scale: 2
    t.decimal  "unit_cost_price",   precision: 8, scale: 2
    t.decimal  "tax_amount",        precision: 8, scale: 2
    t.decimal  "tax_rate",          precision: 8, scale: 2
    t.decimal  "weight",            precision: 8, scale: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_order_items", ["order_id"], name: "index_shoppe_order_items_on_order_id", using: :btree
  add_index "shoppe_order_items", ["ordered_item_id", "ordered_item_type"], name: "index_shoppe_order_items_ordered_item", using: :btree

  create_table "shoppe_orders", force: :cascade do |t|
    t.string   "token"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "billing_address1"
    t.string   "billing_address2"
    t.string   "billing_address3"
    t.string   "billing_address4"
    t.string   "billing_postcode"
    t.integer  "billing_country_id"
    t.string   "email_address"
    t.string   "phone_number"
    t.string   "status"
    t.datetime "received_at"
    t.datetime "accepted_at"
    t.datetime "shipped_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "delivery_service_id"
    t.decimal  "delivery_price",            precision: 8, scale: 2
    t.decimal  "delivery_cost_price",       precision: 8, scale: 2
    t.decimal  "delivery_tax_rate",         precision: 8, scale: 2
    t.decimal  "delivery_tax_amount",       precision: 8, scale: 2
    t.integer  "accepted_by"
    t.integer  "shipped_by"
    t.string   "consignment_number"
    t.datetime "rejected_at"
    t.integer  "rejected_by"
    t.string   "ip_address"
    t.text     "notes"
    t.boolean  "separate_delivery_address",                         default: false
    t.string   "delivery_name"
    t.string   "delivery_address1"
    t.string   "delivery_address2"
    t.string   "delivery_address3"
    t.string   "delivery_address4"
    t.string   "delivery_postcode"
    t.integer  "delivery_country_id"
    t.decimal  "amount_paid",               precision: 8, scale: 2, default: 0.0
    t.boolean  "exported",                                          default: false
    t.string   "invoice_number"
    t.integer  "customer_id"
  end

  add_index "shoppe_orders", ["delivery_service_id"], name: "index_shoppe_orders_on_delivery_service_id", using: :btree
  add_index "shoppe_orders", ["received_at"], name: "index_shoppe_orders_on_received_at", using: :btree
  add_index "shoppe_orders", ["token"], name: "index_shoppe_orders_on_token", using: :btree

  create_table "shoppe_payments", force: :cascade do |t|
    t.integer  "order_id"
    t.decimal  "amount",            precision: 8, scale: 2, default: 0.0
    t.string   "reference"
    t.string   "method"
    t.boolean  "confirmed",                                 default: true
    t.boolean  "refundable",                                default: false
    t.decimal  "amount_refunded",   precision: 8, scale: 2, default: 0.0
    t.integer  "parent_payment_id"
    t.boolean  "exported",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_payments", ["order_id"], name: "index_shoppe_payments_on_order_id", using: :btree
  add_index "shoppe_payments", ["parent_payment_id"], name: "index_shoppe_payments_on_parent_payment_id", using: :btree

  create_table "shoppe_product_attributes", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "key"
    t.string   "value"
    t.integer  "position",   default: 1
    t.boolean  "searchable", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "public",     default: true
  end

  add_index "shoppe_product_attributes", ["key"], name: "index_shoppe_product_attributes_on_key", using: :btree
  add_index "shoppe_product_attributes", ["position"], name: "index_shoppe_product_attributes_on_position", using: :btree
  add_index "shoppe_product_attributes", ["product_id"], name: "index_shoppe_product_attributes_on_product_id", using: :btree

  create_table "shoppe_product_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.string   "ancestral_permalink"
    t.boolean  "permalink_includes_ancestors", default: false
  end

  add_index "shoppe_product_categories", ["lft"], name: "index_shoppe_product_categories_on_lft", using: :btree
  add_index "shoppe_product_categories", ["permalink"], name: "index_shoppe_product_categories_on_permalink", using: :btree
  add_index "shoppe_product_categories", ["rgt"], name: "index_shoppe_product_categories_on_rgt", using: :btree

  create_table "shoppe_product_categorizations", force: :cascade do |t|
    t.integer "product_id",          null: false
    t.integer "product_category_id", null: false
  end

  add_index "shoppe_product_categorizations", ["product_category_id"], name: "categorization_by_product_category_id", using: :btree
  add_index "shoppe_product_categorizations", ["product_id"], name: "categorization_by_product_id", using: :btree

  create_table "shoppe_product_category_translations", force: :cascade do |t|
    t.integer  "shoppe_product_category_id", null: false
    t.string   "locale",                     null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
  end

  add_index "shoppe_product_category_translations", ["locale"], name: "index_shoppe_product_category_translations_on_locale", using: :btree
  add_index "shoppe_product_category_translations", ["shoppe_product_category_id"], name: "index_75826cc72f93d014e54dc08b8202892841c670b4", using: :btree

  create_table "shoppe_product_translations", force: :cascade do |t|
    t.integer  "shoppe_product_id", null: false
    t.string   "locale",            null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name"
    t.string   "permalink"
    t.text     "description"
    t.text     "short_description"
  end

  add_index "shoppe_product_translations", ["locale"], name: "index_shoppe_product_translations_on_locale", using: :btree
  add_index "shoppe_product_translations", ["shoppe_product_id"], name: "index_shoppe_product_translations_on_shoppe_product_id", using: :btree

  create_table "shoppe_products", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "name"
    t.string   "sku"
    t.string   "permalink"
    t.text     "description"
    t.text     "short_description"
    t.boolean  "active",                                    default: true
    t.decimal  "weight",            precision: 8, scale: 3, default: 0.0
    t.decimal  "price",             precision: 8, scale: 2, default: 0.0
    t.decimal  "cost_price",        precision: 8, scale: 2, default: 0.0
    t.integer  "tax_rate_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "featured",                                  default: false
    t.text     "in_the_box"
    t.boolean  "stock_control",                             default: true
    t.boolean  "default",                                   default: false
  end

  add_index "shoppe_products", ["parent_id"], name: "index_shoppe_products_on_parent_id", using: :btree
  add_index "shoppe_products", ["permalink"], name: "index_shoppe_products_on_permalink", using: :btree
  add_index "shoppe_products", ["sku"], name: "index_shoppe_products_on_sku", using: :btree

  create_table "shoppe_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "value_type"
  end

  add_index "shoppe_settings", ["key"], name: "index_shoppe_settings_on_key", using: :btree

  create_table "shoppe_stock_level_adjustments", force: :cascade do |t|
    t.integer  "item_id"
    t.string   "item_type"
    t.string   "description"
    t.integer  "adjustment",  default: 0
    t.string   "parent_type"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_stock_level_adjustments", ["item_id", "item_type"], name: "index_shoppe_stock_level_adjustments_items", using: :btree
  add_index "shoppe_stock_level_adjustments", ["parent_id", "parent_type"], name: "index_shoppe_stock_level_adjustments_parent", using: :btree

  create_table "shoppe_tax_rates", force: :cascade do |t|
    t.string   "name"
    t.decimal  "rate",         precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "country_ids"
    t.string   "address_type"
  end

  create_table "shoppe_users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_address"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shoppe_users", ["email_address"], name: "index_shoppe_users_on_email_address", using: :btree

  create_table "shopping_carts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "total"
    t.decimal  "total_price", precision: 8, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "sliders", force: :cascade do |t|
    t.string   "name"
    t.integer  "position"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string  "name"
    t.decimal "price", precision: 8, scale: 2, default: 0.0
  end

  create_table "subscriptions_features", force: :cascade do |t|
    t.integer "subscription_id"
    t.integer "feature_id"
  end

  add_index "subscriptions_features", ["feature_id"], name: "index_subscriptions_features_on_feature_id", using: :btree
  add_index "subscriptions_features", ["subscription_id"], name: "index_subscriptions_features_on_subscription_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "first_name"
    t.string   "last_name"
    t.boolean  "admin",                  default: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "city_id"
    t.integer  "subscription_id"
    t.boolean  "gender"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
