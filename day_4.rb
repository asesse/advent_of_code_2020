require 'byebug'

class ValidPassport
  attr_reader :passports
  def initialize
    @passports = File.open('files/day_4').read.split("\n")
    group_passports
    turn_into_hash
  end

  def count_valid_passports
    count = 0
    passports.each do |passport|
      count += 1 if is_valid?(passport)
    end
    puts count
  end

  private

  def is_valid?(passport)
    keys = ["byr", "iyr", "eyr", "hgt", "hcl", "ecl", "pid"]
    keys.each do |key|
      return false if !passport.include?(key)
      return false if !send("valid_#{key}?", passport[key]) 
    end
    true
  end

  def group_passports
    current_index = 0
    while current_index < passports.length - 1
      if !passports[current_index + 1].empty?
        passports[current_index] += (" " + passports[current_index + 1])
        passports.delete_at(current_index + 1)
      else
        passports.delete_at(current_index + 1)
        current_index += 1
      end
    end
  end

  def turn_into_hash
    passports.map! do |string|
      string.split.map { _1.split(":") }.to_h  
    end    
  end

  def valid_byr?(byr)
    (1920..2002).include?(byr.to_i)
  end

  def valid_iyr?(iyr)
    (2010..2020).include?(iyr.to_i)
  end

  def valid_eyr?(eyr)
    (2020..2030).include?(eyr.to_i)
  end

  def valid_hgt?(hgt)
    return true if (hgt[-2..] == 'cm') && (150..193).include?(hgt[..-2].to_i)
    return true if (hgt[-2..] == 'in') && (59..79).include?(hgt[..-2].to_i)
    return false
  end

  def valid_hcl?(hcl)
    /\A#[a-fA-F0-9]{6}\z/.match?(hcl)
  end

  def valid_ecl?(ecl)
    ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"].include?(ecl)
  end

  def valid_pid?(pid)
    return false if pid.to_s.length != 9
    /\A\d{9}\z/.match?(pid.to_s)
  end
end

ValidPassport.new.count_valid_passports