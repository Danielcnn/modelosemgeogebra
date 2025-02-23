 // Verifica se já existe um contador de seguidores no localStorage
let followerCount = localStorage.getItem('followerCount');

// Se não existir, inicializa com 0
if (followerCount === null) {
    followerCount = 0;
} else {
    // Converte para número, pois o localStorage armazena strings
    followerCount = parseInt(followerCount, 10);
}

// Atualiza o contador na página
document.getElementById('followerCount').textContent = followerCount;

// Adiciona um evento de clique ao botão "Seguir"
document.getElementById('followButton').addEventListener('click', function() {
    // Incrementa o contador
    followerCount++;
    
    // Atualiza o contador na página
    document.getElementById('followerCount').textContent = followerCount;
    
    // Salva o novo valor no localStorage
    localStorage.setItem('followerCount', followerCount);
});
