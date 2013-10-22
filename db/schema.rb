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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131020053413) do

  create_table "designer_translations", :force => true do |t|
    t.integer  "designer_id"
    t.string   "locale"
    t.text     "about"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "designer_translations", ["designer_id"], :name => "index_designer_translations_on_designer_id"
  add_index "designer_translations", ["locale"], :name => "index_designer_translations_on_locale"

  create_table "designers", :force => true do |t|
    t.string   "name"
    t.text     "about"
    t.string   "facebook"
    t.string   "blogger"
    t.string   "behance"
    t.string   "linkedin"
    t.string   "vimeo"
    t.string   "pinterest"
    t.string   "image"
    t.string   "email"
    t.string   "surname"
    t.string   "curriculum"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "designers", ["slug"], :name => "index_designers_on_slug"

  create_table "designers_jobs", :id => false, :force => true do |t|
    t.integer "designer_id"
    t.integer "job_id"
  end

  create_table "for_sale_item_images", :force => true do |t|
    t.string   "url"
    t.integer  "for_sale_item_id"
    t.integer  "position"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "for_sale_item_translations", :force => true do |t|
    t.integer  "for_sale_item_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "for_sale_item_translations", ["for_sale_item_id"], :name => "index_for_sale_item_translations_on_for_sale_item_id"
  add_index "for_sale_item_translations", ["locale"], :name => "index_for_sale_item_translations_on_locale"

  create_table "for_sale_items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "cover"
    t.integer  "designer_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "for_sale_items", ["slug"], :name => "index_for_sale_items_on_slug"

  create_table "friendly_id_slugs", :force => true do |t|
    t.string   "slug",                         :null => false
    t.integer  "sluggable_id",                 :null => false
    t.string   "sluggable_type", :limit => 40
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type"], :name => "index_friendly_id_slugs_on_slug_and_sluggable_type", :unique => true
  add_index "friendly_id_slugs", ["sluggable_id"], :name => "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], :name => "index_friendly_id_slugs_on_sluggable_type"

  create_table "job_images", :force => true do |t|
    t.string   "url"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "position"
  end

  create_table "job_translations", :force => true do |t|
    t.integer  "job_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "job_translations", ["job_id"], :name => "index_job_translations_on_job_id"
  add_index "job_translations", ["locale"], :name => "index_job_translations_on_locale"

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.integer  "month"
    t.integer  "year"
    t.text     "description"
    t.string   "cover"
    t.boolean  "featured"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "jobs", ["slug"], :name => "index_jobs_on_slug"

  create_table "main_translations", :force => true do |t|
    t.integer  "main_id"
    t.string   "locale"
    t.text     "about"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "main_translations", ["locale"], :name => "index_main_translations_on_locale"
  add_index "main_translations", ["main_id"], :name => "index_main_translations_on_main_id"

  create_table "mains", :force => true do |t|
    t.text     "about"
    t.string   "picture"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
