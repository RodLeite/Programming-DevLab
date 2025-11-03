// 01

let num1 = 25
let num2 = 5
let soma = num1 + num2
let sub = num1 - num2
let mult = num1 * num2
let div = num1 / num2
console.log(soma, sub, mult, div)

// 02
function showImpi() { 
    for (let i = 1; i <= 100; i++) {
      if (i % 2 === 1) { 
        console.log(i);
      }
    }
}

showImpi()

// 03

function contCaracter () {
  let text = "Disciplina de Programação para web";
  let numChar = 0;
  for (let i = 1; i <= text.length; i++) {
    numChar++;
  }
  return numChar;
}

let resultado = contCaracter();
console.log(resultado);


// 04

function gerarEmail(nomeCompleto) {
  const nome = nomeCompleto.split(' ');

  const primeiroNome = nome[0].toLowerCase();
  const ultimoNome = nome[nome.length - 1].toLowerCase();

  const email = `${primeiroNome}.${ultimoNome}@facens.br`;

  return email;
}

const nomeCompleto = "Rodrigo Martins Leite";
const email = gerarEmail(nomeCompleto);

console.log(email);


// 05

for (let i = 1; i <= 10; i++) {
  console.log(i);
  if (i < 10) {
    console.log('-');
  }
}

// 06

function mostraDobro(numero) {
  if (numero <= 0) {
    console.log("Só é aceito números positivos maiores que zero");
    return;
  }

  const dobro = numero * 2;

  console.log(`O dobro de ${numero} é ${dobro}`);
}

mostraDobro(545);
mostraDobro(-2); 

// 07

function inverteString(str) {
  const arrayStr = str.split('');

  arrayStr.reverse();

  const stringInvertida = arrayStr.join('');

  return stringInvertida;
}

const str = "Disciplina de Programação para web";
const stringInvertida = inverteString(str);

console.log(stringInvertida); 

// 08

function contaVogais(strVogal) {
  const vogais = new Set("aeiou");

  let numeroVogais = 0;

  const strMinuscula = strVogal.toLowerCase();

  for (let i = 0; i < strMinuscula.length; i++) {
    if (vogais.has(strMinuscula[i])) {
      numeroVogais++;
    }
  }

  return numeroVogais;
}

const strVogal = "Disciplina de Programação para web";
const numeroVogais = contaVogais(strVogal);

console.log(numeroVogais); 

// 09

function validaEmail(email) {
  const contaArroba = email.split('@').length;
  if (contaArroba !== 2) {
    return false;
  }

  const posicaoPonto = email.lastIndexOf('.');
  if (posicaoPonto === -1 || posicaoPonto < email.indexOf('@')) {
    return false;
  }

  return true;
}

const emailValido = "Rodrigo@gmail.com";
const emailInvalido1 = "Facens@Facens";
const emailInvalido2 = "Rodrigo@@Facens.com";

console.log(validaEmail(emailValido)); 
console.log(validaEmail(emailInvalido1)); 
console.log(validaEmail(emailInvalido2)); 

// 010


