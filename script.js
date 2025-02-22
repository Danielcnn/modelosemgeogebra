// Carrega o número de seguidores do localStorage
let followers = localStorage.getItem('followers') || 0;
document.getElementById('followerCount').textContent = followers;

// Adiciona um seguidor ao clicar no botão
document.getElementById('followButton').addEventListener('click', function() {
    followers++;
    localStorage.setItem('followers', followers);
    document.getElementById('followerCount').textContent = followers;
});
