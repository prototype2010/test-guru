document.addEventListener('turbolinks:load', () => {
    if(document.querySelector('#new_user')) {
        document
            .querySelectorAll('#user_password, #user_password_confirmation')
            .forEach(node => node.addEventListener('input', checkPasswordsMatch))
    }
})

const checkPasswordsMatch = () => {
    const password = document.querySelector('#user_password');
    const passwordConfirmation = document.querySelector('#user_password_confirmation');
    const helperText = document.querySelector('#helper_text')

    if(!passwordConfirmation.value) {
        helperText.innerText = ''
        return;
    }

    if(passwordConfirmation.value !== password.value) {
        helperText.innerText = 'Passwords do not match'
    } else {
        helperText.innerText = ''
    }
}
