import express from 'express';
import HookController from '../Controllers/HookController';

const router = express.Router();

router.post('/github/send', HookController.github);

module.exports = router;
