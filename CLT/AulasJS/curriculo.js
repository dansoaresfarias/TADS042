function hackear(params) {
    document.getElementById("nome").innerHTML = "João Victor de Souza Brayner ";
    document.getElementById("cssJoao").href = "css/joao.css";
    document.getElementById("foto").src = "https://avatars.githubusercontent.com/u/179179804?v=4";
    document.getElementById("foto").classList.add("rounded-circle");
    document.getElementById("foto").classList.add("my-5");
    document.getElementById("cargo").innerHTML = "(Suporte Técnico)";
    document.getElementById("cargo").classList.add("fw-bold");
    var textinho = document.createElement("p");
    textinho.innerHTML = "Olá, meu nome é João Victor de Souza Brayner, sou estudante de Análise e Desenvolvimento de Sistemas na UNIFOR e estou aprendendo a programar em JavaScript. Estou muito animado para aprender mais sobre programação e desenvolver minhas habilidades nessa área.";
    var secNome = document.getElementById("secNome");
    secNome.appendChild(textinho);
}