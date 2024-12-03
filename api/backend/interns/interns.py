from flask import Blueprint, request, jsonify
from models import db, Student, Skill, student_skills

recruiter_bp = Blueprint('recruiter', __name__, url_prefix='/recruiter')

#get all students
@recruiter_bp.route('/students', methods=['GET'])
def get_students():
    students = Student.query.all()
    return jsonify([student.to_dict() for student in students])

#get all job postings
@recruiter_bp.route('/job_postings', methods=['GET'])
def get_job_postings():
    job_postings = JobPosting.query.all()
    return jsonify([job.to_dict() for job in job_postings])

#get student skills
@recruiter_bp.route('/students/<int:id>/qualifications', methods=['GET'])
def get_student_qualifications(id):
    student = Student.query.get_or_404(id)
    skills = db.session.query(Skill).join(student_skills).filter(student_skills.c.studentId == id).all()
    return jsonify({'student': student.to_dict(), 'skills': [skill.skillName for skill in skills]})

#add new student skill
@recruiter_bp.route('/students/<int:id>/qualifications', methods=['POST'])
def add_student_skill(id):
    data = request.get_json()
    skill_name = data.get('skillName')

    skill = Skill.query.filter_by(skillName=skill_name).first()
    if not skill:
        skill = Skill(skillName=skill_name)
        db.session.add(skill)
        db.session.commit()

    db.session.execute(student_skills.insert().values(studentId=id, skillId=skill.id))
    db.session.commit()
    return jsonify({'message': f'Skill "{skill_name}" added to student {id}'}), 201

#delete student's skill
@recruiter_bp.route('/students/<int:student_id>/qualifications/<int:skill_id>', methods=['DELETE'])
def delete_student_skill(student_id, skill_id):
    db.session.execute(student_skills.delete().where(
        (student_skills.c.studentId == student_id) & (student_skills.c.skillId == skill_id)
    ))
    db.session.commit()
    return '', 204
 
