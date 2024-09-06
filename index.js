const express = require('express');
const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');
const { Pool } = require('pg'); // Para o banco de dados

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());

const secretKey = 'digitesuachaveaquicabra';

// Mock de usuários
const users = [
    { id: 1, username: 'admin', password: '123456', perfil: 'admin' },
    { id: 2, username: 'user', password: 'user123', perfil: 'user' },
];

// Banco de Dados (configuração do Pool)
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'mission',
    password: 'postgres',
    port: 5432,
});

// Middleware para validar JWT
function authenticateToken(req, res, next) {
    const token = req.headers['authorization']?.split(' ')[1];
    if (!token) return res.status(401).json({ message: 'Nenhum token fornecido' });

    jwt.verify(token, secretKey, (err, user) => {
        if (err) return res.status(403).json({ message: 'Token inválido ou expirado' });
        req.user = user;
        next();
    });
}

// Login Endpoint
app.post('/api/auth/login', (req, res) => {
    const { username, password } = req.body;
    const user = users.find(u => u.username === username && u.password === password);

    if (user) {
        const token = jwt.sign(
            { userId: user.id, perfil: user.perfil },
            secretKey,
            { expiresIn: '1h' } // Token expira em 1 hora
        );
        res.json({ token });
    } else {
        res.status(401).json({ message: 'Credenciais Invalidas' });
    }
});

// Recupera dados do usuário logado
app.get('/api/me', authenticateToken, (req, res) => {
    const user = users.find(u => u.id === req.user.userId);
    if (user) res.status(200).json(user);
    else res.status(404).json({ message: 'Usuário não encontrado' });
});

// Recupera todos os contratos
app.get('/api/contracts/:empresa/:inicio', authenticateToken, async (req, res) => {
    if (req.user.perfil !== 'admin') {
        return res.status(403).json({ message: 'Acesso Negado' });
    }

    const { empresa, inicio } = req.params;

    try {
        const result = await pool.query('SELECT * FROM seguranca.contracts WHERE empresa = $1 AND data_inicio = $2', [empresa, inicio]);
        if (result.rows.length > 0) {
            res.status(200).json(result.rows);
        } else {
            res.status(404).json({ message: 'Contrato não localizado' });
        }
    } catch (err) {
        res.status(500).json({ message: 'Database error', error: err });
    }
});

// Iniciar o servidor
app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
