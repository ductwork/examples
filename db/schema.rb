# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_12_07_001446) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "ductwork_availabilities", force: :cascade do |t|
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.bigint "execution_id", null: false
    t.integer "process_id"
    t.datetime "started_at", precision: nil, null: false
    t.datetime "updated_at", null: false
    t.index ["completed_at", "started_at", "created_at"], name: "index_ductwork_availabilities_on_claim_latest"
    t.index ["execution_id"], name: "index_ductwork_availabilities_on_execution_id", unique: true
    t.index ["id", "process_id"], name: "index_ductwork_availabilities_on_id_and_process_id"
  end

  create_table "ductwork_executions", force: :cascade do |t|
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.bigint "job_id", null: false
    t.integer "process_id"
    t.integer "retry_count", null: false
    t.datetime "started_at", precision: nil, null: false
    t.datetime "updated_at", null: false
    t.index ["job_id", "created_at"], name: "index_ductwork_executions_on_job_id_and_created_at"
    t.index ["job_id"], name: "index_ductwork_executions_on_job_id"
  end

  create_table "ductwork_jobs", force: :cascade do |t|
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.text "input_args", null: false
    t.string "klass", null: false
    t.text "output_payload"
    t.datetime "started_at", precision: nil, null: false
    t.bigint "step_id", null: false
    t.datetime "updated_at", null: false
    t.index ["step_id"], name: "index_ductwork_jobs_on_step_id", unique: true
  end

  create_table "ductwork_pipelines", force: :cascade do |t|
    t.datetime "claimed_for_advancing_at", precision: nil
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.text "definition", null: false
    t.string "definition_sha1", null: false
    t.string "klass", null: false
    t.datetime "last_advanced_at", precision: nil, null: false
    t.datetime "started_at", precision: nil, null: false
    t.string "status", null: false
    t.datetime "triggered_at", precision: nil, null: false
    t.datetime "updated_at", null: false
    t.index ["klass"], name: "index_ductwork_pipelines_on_klass"
  end

  create_table "ductwork_processes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "last_heartbeat_at", precision: nil, null: false
    t.string "machine_identifier", null: false
    t.integer "pid", null: false
    t.datetime "updated_at", null: false
    t.index ["pid", "machine_identifier"], name: "index_ductwork_processes_on_pid_and_machine_identifier", unique: true
  end

  create_table "ductwork_results", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "error_backtrace"
    t.string "error_klass"
    t.string "error_message"
    t.bigint "execution_id", null: false
    t.string "result_type", null: false
    t.datetime "updated_at", null: false
    t.index ["execution_id"], name: "index_ductwork_results_on_execution_id", unique: true
  end

  create_table "ductwork_runs", force: :cascade do |t|
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.bigint "execution_id", null: false
    t.datetime "started_at", precision: nil, null: false
    t.datetime "updated_at", null: false
    t.index ["execution_id"], name: "index_ductwork_runs_on_execution_id", unique: true
  end

  create_table "ductwork_steps", force: :cascade do |t|
    t.datetime "completed_at", precision: nil
    t.datetime "created_at", null: false
    t.string "klass", null: false
    t.bigint "pipeline_id", null: false
    t.datetime "started_at", precision: nil
    t.string "status", null: false
    t.string "step_type", null: false
    t.datetime "updated_at", null: false
    t.index ["pipeline_id", "klass", "status"], name: "index_ductwork_steps_on_pipeline_id_and_klass_and_status"
    t.index ["pipeline_id", "status", "klass"], name: "index_ductwork_steps_on_pipeline_id_and_status_and_klass"
    t.index ["pipeline_id", "status"], name: "index_ductwork_steps_on_pipeline_id_and_status"
    t.index ["pipeline_id"], name: "index_ductwork_steps_on_pipeline_id"
    t.index ["status", "klass"], name: "index_ductwork_steps_on_status_and_klass"
  end

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.datetime "created_at", null: false
    t.string "favorite_food"
    t.datetime "last_enriched_at", precision: nil
    t.string "name"
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ductwork_availabilities", "ductwork_executions", column: "execution_id"
  add_foreign_key "ductwork_executions", "ductwork_jobs", column: "job_id"
  add_foreign_key "ductwork_jobs", "ductwork_steps", column: "step_id"
  add_foreign_key "ductwork_results", "ductwork_executions", column: "execution_id"
  add_foreign_key "ductwork_runs", "ductwork_executions", column: "execution_id"
  add_foreign_key "ductwork_steps", "ductwork_pipelines", column: "pipeline_id"
end
