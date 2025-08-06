def normalize:
  unique_by(first)
  | sort_by(last)
  ;

def rosterify:
  normalize
  | map(first)
  ;

def gradeify:
  .desiredGrade as $grade
  | .students
  | normalize
  | map(
      select(last == $grade)
	  | first
	)
  ;

if .property == "roster" then
  .input.students | rosterify
elif .property == "grade" then
  .input | gradeify
else
  empty
end
