# frozen_string_literal: true

class Tournament < ApplicationRecord
  enum level: {advanced: 0, middle: 1, beginner: 2}
  enum mode: {cup: 0, championship: 1}
  enum scenario: {one_match: 0, two_match: 1, to_three_win: 2}
  enum status: {in_progress: 0, finished: 1, canceled: 2}
  enum participants: {"0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9, "10": 10, "16": 16, "32": 32, "64": 64, "128": 128}
  validates_each :scenario do |record, attr, value|
    record.errors.add(attr, "Wrong scenario for championship") if record.mode == "championship" && value != "one_match"
  end
  validates_each :participants do |record, attr, value|
    cup_participant = ["4", "8", "16", "32", "64", "128"]
    record.errors.add(attr, "Wrong number of participants") unless record.mode == "cup" && cup_participant.include?(value)
    record.errors.add(attr, "Wrong number of participants") if record.mode == "championship" && value > 10
  end
end
