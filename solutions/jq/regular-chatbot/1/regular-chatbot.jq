def is_valid_command:
  test("^chatbot\\b"; "i");

def remove_emoji:
  gsub("\\bemoji\\d+"; "");

def check_phone_number:
  if test("\\(\\+\\d{2}\\) (?:\\d{3}-){2}\\d{3}") then
    "Thanks! Your phone number is OK."
  else
    "Oops, it seems like I can't reach out to \(.)."
  end;

def get_domains:
  [scan("\\w+\\.\\w+")];

def nice_to_meet_you:
  capture("My name is (?<name>\\S+)"; "i")
  | "Nice to meet you, \(.name)";

def parse_csv:
  split("\\s*,\\s*"; "");
