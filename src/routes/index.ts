import { Router } from 'express';

const router = Router();

router.use('/ssh', require('./ssh'));
router.use('/user', require('./User'));
router.use('/hook', require('./Hook'));
router.use('/server', require('./Server'));

module.exports = router;
