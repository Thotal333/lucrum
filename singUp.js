const $ = (s, o = document) => o.querySelector(s);
const $$ = (s, o = document) => o.querySelectorAll(s);

const signup = $('#signup-form');
const password = $('.input.password input', signup);
const confirmPassword = $('.input.confirm-password input', signup);
const submit = $('button', signup);

// Verifica se a senha e a confirmação coincidem
const validatePasswords = () => {
    if (password.value !== confirmPassword.value || password.value.length < 6) {
        submit.disabled = true;
    } else {
        submit.disabled = false;
    }
};

password.addEventListener('input', validatePasswords);
confirmPassword.addEventListener('input', validatePasswords);

// Adiciona a animação para os novos campos
signup.addEventListener('submit', e => {
    e.preventDefault();
    // Lógica de envio e processamento do formulário
});
