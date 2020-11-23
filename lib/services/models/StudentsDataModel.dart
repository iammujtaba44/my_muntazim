import 'dart:convert';

StudentsDataModel studentDataModelFromJson(String str) =>
    StudentsDataModel.fromJson(json.decode(str));

String studentDataModelToJson(StudentsDataModel data) =>
    json.encode(data.toJson());

class StudentsDataModel {
  StudentsDataModel({
    this.status,
    this.message,
    this.data,
  });

  int status;
  String message;
  Data data;

  factory StudentsDataModel.fromJson(Map<String, dynamic> json) =>
      StudentsDataModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    this.studentsInfo,
  });

  StudentsInfo studentsInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        studentsInfo: StudentsInfo.fromJson(json["students_info"]),
      );

  Map<String, dynamic> toJson() => {
        "students_info": studentsInfo.toJson(),
      };
}

class StudentsInfo {
  StudentsInfo({
    this.studentsList,
  });

  List<StudentsList> studentsList;

  factory StudentsInfo.fromJson(Map<String, dynamic> json) => StudentsInfo(
        studentsList: List<StudentsList>.from(
            json["students_list"].map((x) => StudentsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "students_list":
            List<dynamic>.from(studentsList.map((x) => x.toJson())),
      };
}

class StudentsList {
  StudentsList({
    this.studentId,
    this.studentName,
    this.schoolsList,
  });

  String studentId;
  String studentName;
  List<SchoolsList> schoolsList;

  factory StudentsList.fromJson(Map<String, dynamic> json) => StudentsList(
        studentId: json["student_id"],
        studentName: json["student_name"],
        schoolsList: List<SchoolsList>.from(
            json["schools_list"].map((x) => SchoolsList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "student_id": studentId,
        "student_name": studentName,
        "schools_list": List<dynamic>.from(schoolsList.map((x) => x.toJson())),
      };
}

class SchoolsList {
  SchoolsList({
    this.schoolId,
    this.schoolName,
    this.sessionsList,
  });

  String schoolId;
  String schoolName;
  SessionsList sessionsList;

  factory SchoolsList.fromJson(Map<String, dynamic> json) => SchoolsList(
        schoolId: json["school_id"],
        schoolName: json["school_name"],
        sessionsList: SessionsList.fromJson(json["sessions_list"]),
      );

  Map<String, dynamic> toJson() => {
        "school_id": schoolId,
        "school_name": schoolName,
        "sessions_list": sessionsList.toJson(),
      };
}

class SessionsList {
  SessionsList({
    this.previousAcademicSession,
    this.currentAcademicSession,
    this.nextAcademicSession,
  });

  PreviousAcademicSession previousAcademicSession;
  CurrentAcademicSession currentAcademicSession;
  NextAcademicSession nextAcademicSession;

  factory SessionsList.fromJson(Map<String, dynamic> json) => SessionsList(
        previousAcademicSession: json["previous_academic_session"] == null
            ? null
            : PreviousAcademicSession.fromJson(
                json["previous_academic_session"]),
        currentAcademicSession:
            CurrentAcademicSession.fromJson(json["current_academic_session"]),
        nextAcademicSession: json["next_academic_session"] == null
            ? null
            : NextAcademicSession.fromJson(json["next_academic_session"]),
      );

  Map<String, dynamic> toJson() => {
        "previous_academic_session": previousAcademicSession == null
            ? null
            : previousAcademicSession.toJson(),
        "current_academic_session": currentAcademicSession.toJson(),
        "next_academic_session":
            nextAcademicSession == null ? null : nextAcademicSession.toJson(),
      };
}

class CurrentAcademicSession {
  CurrentAcademicSession({
    this.sessionName,
    this.schoolYear,
    this.enrollmentExist,
    this.grades,
  });

  String sessionName;
  String schoolYear;
  EnrollmentExist enrollmentExist;
  List<CurrentAcademicSessionGrade> grades;

  factory CurrentAcademicSession.fromJson(Map<String, dynamic> json) =>
      CurrentAcademicSession(
        sessionName: json["session_name"],
        schoolYear: json["school_year"],
        enrollmentExist: enrollmentExistValues.map[json["enrollment_exist"]],
        grades: List<CurrentAcademicSessionGrade>.from(
            json["grades"].map((x) => CurrentAcademicSessionGrade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "session_name": sessionName,
        "school_year": schoolYear,
        "enrollment_exist": enrollmentExistValues.reverse[enrollmentExist],
        "grades": List<dynamic>.from(grades.map((x) => x.toJson())),
      };
}

enum EnrollmentExist { N, Y }

final enrollmentExistValues =
    EnumValues({"N": EnrollmentExist.N, "Y": EnrollmentExist.Y});

class CurrentAcademicSessionGrade {
  CurrentAcademicSessionGrade({
    this.programId,
    this.title,
    this.programStartDate,
    this.programEndDate,
    this.rollNumber,
    this.enrollmentStatus,
    this.applicationStatus,
    this.subjectList,
  });

  String programId;
  String title;
  DateTime programStartDate;
  DateTime programEndDate;
  String rollNumber;
  EnrollmentStatus enrollmentStatus;
  ApplicationStatus applicationStatus;
  List<PurpleSubjectList> subjectList;

  factory CurrentAcademicSessionGrade.fromJson(Map<String, dynamic> json) =>
      CurrentAcademicSessionGrade(
        programId: json["program_id"],
        title: json["title"],
        programStartDate: DateTime.parse(json["program_start_date"]),
        programEndDate: DateTime.parse(json["program_end_date"]),
        rollNumber: json["roll_number"],
        enrollmentStatus: enrollmentStatusValues.map[json["enrollment_status"]],
        applicationStatus:
            applicationStatusValues.map[json["application_status"]],
        subjectList: List<PurpleSubjectList>.from(
            json["subject_list"].map((x) => PurpleSubjectList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "program_id": programId,
        "title": title,
        "program_start_date":
            "${programStartDate.year.toString().padLeft(4, '0')}-${programStartDate.month.toString().padLeft(2, '0')}-${programStartDate.day.toString().padLeft(2, '0')}",
        "program_end_date":
            "${programEndDate.year.toString().padLeft(4, '0')}-${programEndDate.month.toString().padLeft(2, '0')}-${programEndDate.day.toString().padLeft(2, '0')}",
        "roll_number": rollNumber,
        "enrollment_status": enrollmentStatusValues.reverse[enrollmentStatus],
        "application_status":
            applicationStatusValues.reverse[applicationStatus],
        "subject_list": List<dynamic>.from(subjectList.map((x) => x.toJson())),
      };
}

enum ApplicationStatus { REJECTED, APPROVED, SUBMITTED, TRANSFER }

final applicationStatusValues = EnumValues({
  "Approved": ApplicationStatus.APPROVED,
  "Rejected": ApplicationStatus.REJECTED,
  "Submitted": ApplicationStatus.SUBMITTED,
  "Transfer": ApplicationStatus.TRANSFER
});

enum EnrollmentStatus { UNENROLLED, ENROLLED }

final enrollmentStatusValues = EnumValues({
  "Enrolled": EnrollmentStatus.ENROLLED,
  "Unenrolled": EnrollmentStatus.UNENROLLED
});

class PurpleSubjectList {
  PurpleSubjectList({
    this.subjectId,
    this.subjectTitle,
    this.reportCard,
  });

  String subjectId;
  String subjectTitle;
  dynamic reportCard;

  factory PurpleSubjectList.fromJson(Map<String, dynamic> json) =>
      PurpleSubjectList(
        subjectId: json["subject_id"],
        subjectTitle: json["subject_title"],
        reportCard: json["report_card"],
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "subject_title": subjectTitle,
        "report_card": reportCard,
      };
}

class PurpleReportCard {
  PurpleReportCard({
    this.duration,
  });

  List<PurpleDuration> duration;

  factory PurpleReportCard.fromJson(Map<String, dynamic> json) =>
      PurpleReportCard(
        duration: List<PurpleDuration>.from(
            json["duration"].map((x) => PurpleDuration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "duration": List<dynamic>.from(duration.map((x) => x.toJson())),
      };
}

class PurpleDuration {
  PurpleDuration({
    this.durationTitle,
    this.attributes,
    this.grading,
  });

  PurpleDurationTitle durationTitle;
  dynamic attributes;
  PurpleGrading grading;

  factory PurpleDuration.fromJson(Map<String, dynamic> json) => PurpleDuration(
        durationTitle: purpleDurationTitleValues.map[json["duration_title"]],
        attributes: json["attributes"],
        grading: PurpleGrading.fromJson(json["grading"]),
      );

  Map<String, dynamic> toJson() => {
        "duration_title": purpleDurationTitleValues.reverse[durationTitle],
        "attributes": attributes,
        "grading": grading.toJson(),
      };
}

class AttributesClass {
  AttributesClass({
    this.attendance,
    this.assignment,
    this.quiz,
    this.homework,
    this.behaviour,
    this.exam,
    this.teacher,
  });

  List<Attendance> attendance;
  List<Assignment> assignment;
  List<Behaviour> quiz;
  List<Behaviour> homework;
  List<Behaviour> behaviour;
  List<Behaviour> exam;
  List<Teacher> teacher;

  factory AttributesClass.fromJson(Map<String, dynamic> json) =>
      AttributesClass(
        attendance: json["attendance"] == null
            ? null
            : List<Attendance>.from(
                json["attendance"].map((x) => Attendance.fromJson(x))),
        assignment: json["assignment"] == null
            ? null
            : List<Assignment>.from(
                json["assignment"].map((x) => Assignment.fromJson(x))),
        quiz: json["quiz"] == null
            ? null
            : List<Behaviour>.from(
                json["quiz"].map((x) => Behaviour.fromJson(x))),
        homework: json["homework"] == null
            ? null
            : List<Behaviour>.from(
                json["homework"].map((x) => Behaviour.fromJson(x))),
        behaviour: json["behaviour"] == null
            ? null
            : List<Behaviour>.from(
                json["behaviour"].map((x) => Behaviour.fromJson(x))),
        exam: json["exam"] == null
            ? null
            : List<Behaviour>.from(
                json["exam"].map((x) => Behaviour.fromJson(x))),
        teacher: json["teacher"] == null
            ? null
            : List<Teacher>.from(
                json["teacher"].map((x) => Teacher.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attendance": attendance == null
            ? null
            : List<dynamic>.from(attendance.map((x) => x.toJson())),
        "assignment": assignment == null
            ? null
            : List<dynamic>.from(assignment.map((x) => x.toJson())),
        "quiz": quiz == null
            ? null
            : List<dynamic>.from(quiz.map((x) => x.toJson())),
        "homework": homework == null
            ? null
            : List<dynamic>.from(homework.map((x) => x.toJson())),
        "behaviour": behaviour == null
            ? null
            : List<dynamic>.from(behaviour.map((x) => x.toJson())),
        "exam": exam == null
            ? null
            : List<dynamic>.from(exam.map((x) => x.toJson())),
        "teacher": teacher == null
            ? null
            : List<dynamic>.from(teacher.map((x) => x.toJson())),
      };
}

class Assignment {
  Assignment({
    this.assignmentTitle,
    this.obtainedMarks,
    this.totalMarks,
    this.weight,
  });

  AssignmentAssignmentTitle assignmentTitle;
  String obtainedMarks;
  String totalMarks;
  dynamic weight;

  factory Assignment.fromJson(Map<String, dynamic> json) => Assignment(
        assignmentTitle:
            assignmentAssignmentTitleValues.map[json["assignment_title"]],
        obtainedMarks: json["obtained_marks"],
        totalMarks: json["total_marks"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "assignment_title":
            assignmentAssignmentTitleValues.reverse[assignmentTitle],
        "obtained_marks": obtainedMarks,
        "total_marks": totalMarks,
        "weight": weight,
      };
}

enum AssignmentAssignmentTitle {
  MATH,
  ASS1,
  MATH23,
  U1,
  U3,
  U2,
  ASSIGNMENT,
  E,
  U,
  ENG
}

final assignmentAssignmentTitleValues = EnumValues({
  "Ass1": AssignmentAssignmentTitle.ASS1,
  "Assignment": AssignmentAssignmentTitle.ASSIGNMENT,
  "E": AssignmentAssignmentTitle.E,
  "Eng": AssignmentAssignmentTitle.ENG,
  "Math": AssignmentAssignmentTitle.MATH,
  "Math23": AssignmentAssignmentTitle.MATH23,
  "U": AssignmentAssignmentTitle.U,
  "U1": AssignmentAssignmentTitle.U1,
  "U2": AssignmentAssignmentTitle.U2,
  "u3": AssignmentAssignmentTitle.U3
});

class Attendance {
  Attendance({
    this.obtainedMarks,
    this.totalMarks,
    this.weight,
  });

  int obtainedMarks;
  int totalMarks;
  String weight;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        obtainedMarks: json["obtained_marks"],
        totalMarks: json["total_marks"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "obtained_marks": obtainedMarks,
        "total_marks": totalMarks,
        "weight": weight,
      };
}

class Behaviour {
  Behaviour({
    this.assignmentTitle,
    this.obtainedMarks,
    this.totalMarks,
    this.weight,
  });

  BehaviourAssignmentTitle assignmentTitle;
  String obtainedMarks;
  String totalMarks;
  String weight;

  factory Behaviour.fromJson(Map<String, dynamic> json) => Behaviour(
        assignmentTitle:
            behaviourAssignmentTitleValues.map[json["assignment_title"]],
        obtainedMarks: json["obtained_marks"],
        totalMarks: json["total_marks"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "assignment_title":
            behaviourAssignmentTitleValues.reverse[assignmentTitle],
        "obtained_marks": obtainedMarks,
        "total_marks": totalMarks,
        "weight": weight,
      };
}

enum BehaviourAssignmentTitle { BEHAVIOUR, MA90, M2, E2, EG, M1 }

final behaviourAssignmentTitleValues = EnumValues({
  "Behaviour": BehaviourAssignmentTitle.BEHAVIOUR,
  "E2": BehaviourAssignmentTitle.E2,
  "EG": BehaviourAssignmentTitle.EG,
  "M1": BehaviourAssignmentTitle.M1,
  "M2": BehaviourAssignmentTitle.M2,
  "Ma90": BehaviourAssignmentTitle.MA90
});

class Teacher {
  Teacher({
    this.assignmentTitle,
    this.obtainedMarks,
    this.totalMarks,
    this.weight,
  });

  TeacherAssignmentTitle assignmentTitle;
  String obtainedMarks;
  String totalMarks;
  int weight;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        assignmentTitle:
            teacherAssignmentTitleValues.map[json["assignment_title"]],
        obtainedMarks: json["obtained_marks"],
        totalMarks: json["total_marks"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "assignment_title":
            teacherAssignmentTitleValues.reverse[assignmentTitle],
        "obtained_marks": obtainedMarks,
        "total_marks": totalMarks,
        "weight": weight,
      };
}

enum TeacherAssignmentTitle { E4 }

final teacherAssignmentTitleValues =
    EnumValues({"E4": TeacherAssignmentTitle.E4});

enum PurpleDurationTitle { CURRENT_ACADEMIC_SESSION, ALL }

final purpleDurationTitleValues = EnumValues({
  "All": PurpleDurationTitle.ALL,
  "current_academic_session": PurpleDurationTitle.CURRENT_ACADEMIC_SESSION
});

class PurpleGrading {
  PurpleGrading({
    this.percentageGrade,
  });

  PurplePercentageGrade percentageGrade;

  factory PurpleGrading.fromJson(Map<String, dynamic> json) => PurpleGrading(
        percentageGrade:
            PurplePercentageGrade.fromJson(json["percentage_grade"]),
      );

  Map<String, dynamic> toJson() => {
        "percentage_grade": percentageGrade.toJson(),
      };
}

class PurplePercentageGrade {
  PurplePercentageGrade({
    this.percentage,
    this.grade,
  });

  dynamic percentage;
  GradeEnum grade;

  factory PurplePercentageGrade.fromJson(Map<String, dynamic> json) =>
      PurplePercentageGrade(
        percentage: json["percentage"],
        grade: gradeEnumValues.map[json["grade"]],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "grade": gradeEnumValues.reverse[grade],
      };
}

enum GradeEnum { F, EMPTY }

final gradeEnumValues = EnumValues({"": GradeEnum.EMPTY, "F": GradeEnum.F});

class NextAcademicSession {
  NextAcademicSession({
    this.sessionName,
    this.schoolYear,
    this.enrollmentExist,
    this.grades,
  });

  String sessionName;
  String schoolYear;
  EnrollmentExist enrollmentExist;
  List<NextAcademicSessionGrade> grades;

  factory NextAcademicSession.fromJson(Map<String, dynamic> json) =>
      NextAcademicSession(
        sessionName: json["session_name"],
        schoolYear: json["school_year"],
        enrollmentExist: enrollmentExistValues.map[json["enrollment_exist"]],
        grades: List<NextAcademicSessionGrade>.from(
            json["grades"].map((x) => NextAcademicSessionGrade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "session_name": sessionName,
        "school_year": schoolYear,
        "enrollment_exist": enrollmentExistValues.reverse[enrollmentExist],
        "grades": List<dynamic>.from(grades.map((x) => x.toJson())),
      };
}

class NextAcademicSessionGrade {
  NextAcademicSessionGrade({
    this.programId,
    this.title,
    this.programStartDate,
    this.programEndDate,
    this.rollNumber,
    this.enrollmentStatus,
    this.applicationStatus,
    this.subjectList,
  });

  String programId;
  String title;
  DateTime programStartDate;
  DateTime programEndDate;
  String rollNumber;
  EnrollmentStatus enrollmentStatus;
  ApplicationStatus applicationStatus;
  List<FluffySubjectList> subjectList;

  factory NextAcademicSessionGrade.fromJson(Map<String, dynamic> json) =>
      NextAcademicSessionGrade(
        programId: json["program_id"],
        title: json["title"],
        programStartDate: DateTime.parse(json["program_start_date"]),
        programEndDate: DateTime.parse(json["program_end_date"]),
        rollNumber: json["roll_number"],
        enrollmentStatus: enrollmentStatusValues.map[json["enrollment_status"]],
        applicationStatus:
            applicationStatusValues.map[json["application_status"]],
        subjectList: List<FluffySubjectList>.from(
            json["subject_list"].map((x) => FluffySubjectList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "program_id": programId,
        "title": title,
        "program_start_date":
            "${programStartDate.year.toString().padLeft(4, '0')}-${programStartDate.month.toString().padLeft(2, '0')}-${programStartDate.day.toString().padLeft(2, '0')}",
        "program_end_date":
            "${programEndDate.year.toString().padLeft(4, '0')}-${programEndDate.month.toString().padLeft(2, '0')}-${programEndDate.day.toString().padLeft(2, '0')}",
        "roll_number": rollNumber,
        "enrollment_status": enrollmentStatusValues.reverse[enrollmentStatus],
        "application_status":
            applicationStatusValues.reverse[applicationStatus],
        "subject_list": List<dynamic>.from(subjectList.map((x) => x.toJson())),
      };
}

class FluffySubjectList {
  FluffySubjectList({
    this.subjectId,
    this.subjectTitle,
    this.reportCard,
  });

  String subjectId;
  String subjectTitle;
  SubjectListReportCardClass reportCard;

  factory FluffySubjectList.fromJson(Map<String, dynamic> json) =>
      FluffySubjectList(
        subjectId: json["subject_id"],
        subjectTitle: json["subject_title"],
        reportCard: SubjectListReportCardClass.fromJson(json["report_card"]),
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "subject_title": subjectTitle,
        "report_card": reportCard.toJson(),
      };
}

class SubjectListReportCardClass {
  SubjectListReportCardClass({
    this.duration,
  });

  List<FluffyDuration> duration;

  factory SubjectListReportCardClass.fromJson(Map<String, dynamic> json) =>
      SubjectListReportCardClass(
        duration: List<FluffyDuration>.from(
            json["duration"].map((x) => FluffyDuration.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "duration": List<dynamic>.from(duration.map((x) => x.toJson())),
      };
}

class FluffyDuration {
  FluffyDuration({
    this.durationTitle,
    this.attributes,
    this.grading,
  });

  FluffyDurationTitle durationTitle;
  List<dynamic> attributes;
  FluffyGrading grading;

  factory FluffyDuration.fromJson(Map<String, dynamic> json) => FluffyDuration(
        durationTitle: fluffyDurationTitleValues.map[json["duration_title"]],
        attributes: List<dynamic>.from(json["attributes"].map((x) => x)),
        grading: FluffyGrading.fromJson(json["grading"]),
      );

  Map<String, dynamic> toJson() => {
        "duration_title": fluffyDurationTitleValues.reverse[durationTitle],
        "attributes": List<dynamic>.from(attributes.map((x) => x)),
        "grading": grading.toJson(),
      };
}

enum FluffyDurationTitle {
  CURRENT_ACADEMIC_SESSION,
  NS_FIRST_TERM,
  NS_SECOND_TERM
}

final fluffyDurationTitleValues = EnumValues({
  "current_academic_session": FluffyDurationTitle.CURRENT_ACADEMIC_SESSION,
  "NS First Term": FluffyDurationTitle.NS_FIRST_TERM,
  "NS Second Term": FluffyDurationTitle.NS_SECOND_TERM
});

class FluffyGrading {
  FluffyGrading({
    this.percentageGrade,
  });

  FluffyPercentageGrade percentageGrade;

  factory FluffyGrading.fromJson(Map<String, dynamic> json) => FluffyGrading(
        percentageGrade:
            FluffyPercentageGrade.fromJson(json["percentage_grade"]),
      );

  Map<String, dynamic> toJson() => {
        "percentage_grade": percentageGrade.toJson(),
      };
}

class FluffyPercentageGrade {
  FluffyPercentageGrade({
    this.percentage,
    this.grade,
  });

  int percentage;
  String grade;

  factory FluffyPercentageGrade.fromJson(Map<String, dynamic> json) =>
      FluffyPercentageGrade(
        percentage: json["percentage"],
        grade: json["grade"],
      );

  Map<String, dynamic> toJson() => {
        "percentage": percentage,
        "grade": grade,
      };
}

class PreviousAcademicSession {
  PreviousAcademicSession({
    this.sessionName,
    this.schoolYear,
    this.enrollmentExist,
    this.grades,
  });

  String sessionName;
  String schoolYear;
  EnrollmentExist enrollmentExist;
  List<PreviousAcademicSessionGrade> grades;

  factory PreviousAcademicSession.fromJson(Map<String, dynamic> json) =>
      PreviousAcademicSession(
        sessionName: json["session_name"],
        schoolYear: json["school_year"],
        enrollmentExist: enrollmentExistValues.map[json["enrollment_exist"]],
        grades: List<PreviousAcademicSessionGrade>.from(json["grades"]
            .map((x) => PreviousAcademicSessionGrade.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "session_name": sessionName,
        "school_year": schoolYear,
        "enrollment_exist": enrollmentExistValues.reverse[enrollmentExist],
        "grades": List<dynamic>.from(grades.map((x) => x.toJson())),
      };
}

class PreviousAcademicSessionGrade {
  PreviousAcademicSessionGrade({
    this.programId,
    this.title,
    this.programStartDate,
    this.programEndDate,
    this.rollNumber,
    this.enrollmentStatus,
    this.applicationStatus,
    this.subjectList,
  });

  String programId;
  String title;
  DateTime programStartDate;
  DateTime programEndDate;
  String rollNumber;
  EnrollmentStatus enrollmentStatus;
  ApplicationStatus applicationStatus;
  List<TentacledSubjectList> subjectList;

  factory PreviousAcademicSessionGrade.fromJson(Map<String, dynamic> json) =>
      PreviousAcademicSessionGrade(
        programId: json["program_id"],
        title: json["title"],
        programStartDate: DateTime.parse(json["program_start_date"]),
        programEndDate: DateTime.parse(json["program_end_date"]),
        rollNumber: json["roll_number"],
        enrollmentStatus: enrollmentStatusValues.map[json["enrollment_status"]],
        applicationStatus:
            applicationStatusValues.map[json["application_status"]],
        subjectList: List<TentacledSubjectList>.from(
            json["subject_list"].map((x) => TentacledSubjectList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "program_id": programId,
        "title": title,
        "program_start_date":
            "${programStartDate.year.toString().padLeft(4, '0')}-${programStartDate.month.toString().padLeft(2, '0')}-${programStartDate.day.toString().padLeft(2, '0')}",
        "program_end_date":
            "${programEndDate.year.toString().padLeft(4, '0')}-${programEndDate.month.toString().padLeft(2, '0')}-${programEndDate.day.toString().padLeft(2, '0')}",
        "roll_number": rollNumber,
        "enrollment_status": enrollmentStatusValues.reverse[enrollmentStatus],
        "application_status":
            applicationStatusValues.reverse[applicationStatus],
        "subject_list": List<dynamic>.from(subjectList.map((x) => x.toJson())),
      };
}

class TentacledSubjectList {
  TentacledSubjectList({
    this.subjectId,
    this.subjectTitle,
    this.reportCard,
  });

  String subjectId;
  String subjectTitle;
  dynamic reportCard;

  factory TentacledSubjectList.fromJson(Map<String, dynamic> json) =>
      TentacledSubjectList(
        subjectId: json["subject_id"],
        subjectTitle: json["subject_title"],
        reportCard: json["report_card"],
      );

  Map<String, dynamic> toJson() => {
        "subject_id": subjectId,
        "subject_title": subjectTitle,
        "report_card": reportCard,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
