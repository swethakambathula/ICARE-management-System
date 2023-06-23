module ApplicationHelper
  def can_pick_patient_as_a_doctor(patient_records)
    record_exists = true
    doctor_count = 0
    patient_records&.all&.each do |record|
      doctor_count += 1 if record.user.role.slug == "doctor"
      record_exists = false if record.patient_record.treatment_city != current_user.city
    end
    if doctor_count >= 1
      record_exists = false
    end

    record_exists
  end

  def can_pick_patient_as_nurse(patient_records)
    record_exists = true
    nurse_count = 0


    patient_records&.all&.each do |record|
      nurse_count += 1 if record.user.role.slug == "nurse"
      record_exists = false if record.patient_record.treatment_city != current_user.city
    end

    record_exists = false if nurse_count >= 3
    record_exists
  end

end
