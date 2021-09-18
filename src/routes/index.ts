import { Router } from 'express';

const router = Router();

router.use('/ssh', require('./ssh'));

module.exports = router;
