class ExerciseEntry < ApplicationRecord
  belongs_to :workout
  belongs_to :exercise
  # accepts_nested_attributes_for :exercise

  validates :workout_id, presence: true
  validates :exercise_id, presence: true
  validates :sets, presence: true
  validates :reps, presence: true
  validates :exercise_rating, presence: true, inclusion: {in: [1, 2, 3, 4, 5]}

  def exercise_attributes=(exercise_attributes)
    self.exercise = Exercise.find_or_create_by(exercise_attributes) if self.exercise_id.nil?
  end
end
