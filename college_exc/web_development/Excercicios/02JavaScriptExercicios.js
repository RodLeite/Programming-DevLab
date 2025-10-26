// 01 

class Usuario {
    constructor(nome, idade) {
      this.nome = nome;
      this.idade = idade;
    }
  }
  
  const usuarios = [
    new Usuario("Cleiton", 14),
    new Usuario("Cris", 25),
    new Usuario("Daiana", 30),
  ];
  
  const nomesMaiusculos = usuarios.map((usuario) => usuario.nome.toUpperCase());
  
  console.log(nomesMaiusculos); 

  // 02

function filtrarUsuariosMaioresDeIdade(usuarios) {
    return usuarios.filter((usuario) => usuario.idade > 18);
  }
  
  const usuariosMaioresDeIdade = filtrarUsuariosMaioresDeIdade(usuarios);
  
  console.log(usuariosMaioresDeIdade); 
  

  // 03
function find25a30(usuarios) {
    return usuarios.find((usuario) => usuario.idade >= 25 && usuario.idade <= 30);
  }
  
  const primeiroUsuarioComIdadeEntre25e30 = find25a30(usuarios);
  
  console.log(primeiroUsuarioComIdadeEntre25e30); 

  // 04
const numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

const numerosPares = numeros.filter(function(numero) {
  return numero % 2 === 0;
});

const numerosDobrados = numerosPares.map(function(numero) {
  return numero * 2;
});
console.log(numerosDobrados); 

// 05

class Animal {
  constructor() {}

  emitirSom() {
  }

  correr() {
    console.log("Correndo...");
  }
}

class Cachorro extends Animal {
  constructor() {
    super();
  }

  emitirSom() {
    console.log("Au au!");
  }
}


class Gato extends Animal {
  constructor() {
    super();
  }

  emitirSom() {
    console.log("Miau!");
  }
}

const cachorro = new Cachorro();
cachorro.emitirSom();
cachorro.correr(); 

const gato = new Gato();
gato.emitirSom();
gato.correr();

// 06
class Livro {
  constructor(titulo, paginas) {
    this.titulo = titulo;
    this.paginas = paginas;
  }
}

const livros = [
  new Livro("A Revolução dos Bichos", 120),
  new Livro("O Senhor dos Anéis", 1178),
  new Livro("O Pequeno Príncipe", 96),
  new Livro("1984", 328),
  new Livro("Fahrenheit 451", 256),
];

const livrosComMaisDe300Paginas = livros.filter(function(livro) {
  return livro.paginas > 300;
});

console.log(livrosComMaisDe300Paginas);

// 07

class Carro {
  constructor(marca, ano) {
    this.marca = marca;
    this.ano = ano;
  }
}

const carros = [
  new Carro("Fiat", 2015),
  new Carro("Toyota", 2018),
  new Carro("Chevrolet", 2008),
  new Carro("Toyota", 2020),
  new Carro("Volkswagen", 2019),
];

const primeiroCarroToyota = carros.find(function(carro) {
  return carro.marca === "Toyota";
});

const carrosFiltradosPorAno = carros.filter(function(carro) {
  return carro.ano > 2010;
});

console.log("Primeiro carro da Toyota:", primeiroCarroToyota);
console.log("Carros fabricados após 2010:", carrosFiltradosPorAno);

// 08 e 09
class Produto {
  constructor(nome, preco){
  this.nome = nome;
  this.preco = preco;
}}

let produtos = [
  new Produto("Produto 1", 29.9),
  new Produto("Produto 2", 3.55),
  new Produto("Produto 3", 167.99)  
];

console.log("Produtos: ")
console.log(produtos);

let aumento = produtos.map(produto => produto.preco * 1.1);

console.log("Produtos com aumento de 10%: ")
console.log(aumento);

let produtoMaior100 = produtos.find(produto => produto.preco > 100);
console.log("Produto caro: ");
console.log(produtoMaior100);

// 010
let numerosarray = [1,2,3,4,5,6,7,8,9,10];
console.log(`Números: ${numeros}`);


let numerosDivisivelPorTres = numeros.filter(numerosarray => numerosarray % 3 == 0);
console.log(`Números divisíveis por três: ${numerosDivisivelPorTres}`);

 let numerosQuadrado = numerosDivisivelPorTres.map(numerosDivisivelPorTres => numerosDivisivelPorTres * numerosDivisivelPorTres);
console.log(`Números ao quadrado: ${numerosQuadrado}`);
  const primeiroUsuarioComIdadeEntre25e30 = find25a30(usuarios);
  
  console.log(primeiroUsuarioComIdadeEntre25e30); 
