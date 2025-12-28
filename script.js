document.addEventListener('DOMContentLoaded', function() {
    // 1. Seleciona os elementos principais
    const menuIcon = document.getElementById('menu-icon'); // Ícone de hambúrguer
    const closeIcon = document.getElementById('close-icon'); // Ícone de fechar (X)
    const sideMenu = document.getElementById('side-menu'); // O menu lateral
    const navbar = document.querySelector('.navbar'); // A barra de navegação (para possíveis ajustes)

    // 2. Função para abrir o menu lateral
    function openMenu() {
        sideMenu.classList.add('open'); // Adiciona a classe 'open'
        menuIcon.style.display = 'none'; // Esconde o ícone de hambúrguer
        closeIcon.style.display = 'block'; // Mostra o ícone de fechar
        navbar.classList.add('menu-open'); // Adiciona classe à navbar para ajustes de estilo se necessário
    }

    // 3. Função para fechar o menu lateral
    function closeMenu() {
        sideMenu.classList.remove('open'); // Remove a classe 'open'
        menuIcon.style.display = 'block'; // Mostra o ícone de hambúrguer
        closeIcon.style.display = 'none'; // Esconde o ícone de fechar
        navbar.classList.remove('menu-open'); // Remove classe da navbar
    }

    // 4. Adiciona os ouvintes de evento de clique
    // Ao clicar no ícone de hambúrguer, abre o menu
    if (menuIcon) {
        menuIcon.addEventListener('click', openMenu);
    }

    // Ao clicar no ícone de fechar, fecha o menu
    if (closeIcon) {
        closeIcon.addEventListener('click', closeMenu);
    }
    
    // Opcional: Fechar o menu ao clicar em um link interno (para usabilidade)
    const menuLinks = sideMenu.querySelectorAll('a');
    menuLinks.forEach(link => {
        link.addEventListener('click', closeMenu);
    });

    // Opcional: Inicialmente, o ícone de fechar deve estar escondido
    closeIcon.style.display = 'none';
});