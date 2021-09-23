const expressJwt = require('express-jwt');

 let jwuser = expressJwt({
        
       secret: 'secrettt',
       algorithms: ['HS256'],
       isRevoked: isRevoked
    }).unless({
        path: [
            
            '/posts/',
             '/user',
             '/user/login',
             '/user/register'
            
        ]
    })

async function isRevoked(req, payload, done){
    if(!payload.isAdmin){
        done()
    }
    done(null, true);
}

module.exports = jwuser;