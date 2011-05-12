class Schema < ActiveRecord::Migration
  def self.up
    # Holds username,email, avatar(image link) and timestamp
    # Has many habits
    create_table :users do |t|
      t.string :username, :limit => 25
      t.string :email, :limit => 30
      t.string :avatar
      t.timestamp
    end

    # Hold description of a habit
    # Many habits belongs to a user
    # Each user has many habits
    create_table :habits do |t|
      t.references :category
      t.string :description
      t.timestamp
    end

    add_index :habits, [:category_id]

    # Holds habit category
    # Each category has many habits
    # A habit belongs to a category
    create_table :categories do |t|
      t.string :description
      t.string :image
      t.timestamp
    end

    # Many to many rich join
    # Holds habits schedule
    # habit belongs to a user
    # user belongs to a habit
    create_table :habit_users do |t|
      t.references :habit
      t.references :user
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.timestamp
    end
    add_index :habit_users, [:habit_id,:user_id]

    # Many to Many Rich Join
    # Holds date,comments and mood
    # log belongs to a user
    # user belongs to a log
    # habit belongs to a log
    # log belongs to a habit
    create_table :logs do |t|
      t.references :user
      t.references :habit
      t.boolean :done
      t.text :comment
      t.datetime :date
      t.timestamp
    end
    add_index :logs, [:habit_id, :user_id]
  end

  def self.down
    drop_table :users
    drop_table :habits
    drop_table :categories
    drop_table :habit_users
    drop_table :logs
  end
end
