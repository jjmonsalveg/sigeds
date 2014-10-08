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

ActiveRecord::Schema.define(version: 20141008161611) do

  create_table "clientes", force: true do |t|
    t.string   "direccion"
    t.string   "direccionFiscal"
    t.string   "fax"
    t.string   "nombre"
    t.string   "rif"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contactos", force: true do |t|
    t.string   "email"
    t.string   "nombre"
    t.string   "telefonoCelular"
    t.string   "telefonoOficina"
    t.integer  "cliente_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contactos", ["cliente_id"], name: "index_contactos_on_cliente_id"

  create_table "personals", force: true do |t|
    t.string   "nombre",           limit: 50
    t.string   "apellido",         limit: 50
    t.string   "cedula",           limit: 15
    t.string   "direccion",        limit: 50
    t.string   "telefono_casa",    limit: 15
    t.string   "telefono_celular", limit: 30
    t.string   "sexo",             limit: 1
    t.date     "fecha_nacimiento"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "personals", ["cedula"], name: "index_personals_on_cedula", unique: true

  create_table "users", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "rol",             default: 0
    t.integer  "personal_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["personal_id"], name: "index_users_on_personal_id", unique: true

end
