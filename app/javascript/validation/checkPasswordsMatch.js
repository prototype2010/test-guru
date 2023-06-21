document.addEventListener('turbolinks:load', () => {
    const form = document
        .querySelector('#new_user')

    if(form) {
        new PasswordsMatchChecker(form).listenFormChange()
    }
})

class PasswordsMatchChecker {
    constructor(form,
                passwordId = '#user_password',
                confirmationId = '#user_password_confirmation',
                helperId = '#helper_text') {
        this.form = form
        this.password = form.querySelector(passwordId);
        this.passwordConfirmation = form.querySelector(confirmationId);
        this.helperText = form.querySelector(helperId);
    }

    listenFormChange = () => {
        this.form.addEventListener('input', this.validate)
    }

    validate = () => {
        if(!this.passwordConfirmation.value) {
            this.helperText.innerText = ''
            return;
        }

        if(this.passwordConfirmation.value !== this.password.value) {
            this.helperText.innerText = 'Passwords do not match'
        } else {
            this.helperText.innerText = ''
        }
    }
}

