package fa.training.validator;

import fa.training.entities.Gender;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class GenderValidator implements ConstraintValidator<Sex, Gender> {
    @Override
    public void initialize(Sex constraintAnnotation) {
    }

    @Override
    public boolean isValid(Gender gender, ConstraintValidatorContext context) {
        if((gender != Gender.FEMALE) && (gender != Gender.MALE)) {
            System.out.println("hahaha gender");
            return false;
        }
        return true;
    }
}
