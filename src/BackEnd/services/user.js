const { PrismaClient } = require('@prisma/client')

const jwt = require('jsonwebtoken');
const uuid = require('uuid').v4;

const bcrypt = require('bcryptjs')

const prisma = new PrismaClient()

class User {
    async Create(email, name, password) {
        //Verify if user already exists
        const userExists = await prisma.user.findUnique({
            where: {
                email: email,
            },
        })

        if (userExists) {
            throw new Error('User already exists')
        }

        //Verificação de senha != "", e HASH da mesma
        if(password) {
            const hashedPassWord = await bcrypt.hash(password, 8) 

            password = hashedPassWord
        }

        //Create user
        const user = await prisma.user.create({
            data: {
                id: uuid(),
                email: email,
                name: name,
                password: password,
            },
        })
        return user
    }

    async Authenticate(email, pass) {
        console.log(email, pass)
        //verify if user exists
        const user = await prisma.user.findUnique({
            where: {
                email: email
            }
        })

        console.log(user)

        if (!user) {
            throw new Error('Invalid Email or/and Password')
        }

        //verify if password is correct
        const passMatch = await bcrypt.compare(pass, user.password)

        if (!passMatch) {
            throw new Error('Invalid Email or/and Password')
        }

        //generate token
        const token = jwt.sign({ id: user.id }, process.env.TOKEN_USER_AUTH, {
            expiresIn: '1h'
        })

        const refresh_token = jwt.sign({ id: user.id }, process.env.TOKEN_USER_REFRESH, {
            expiresIn: '10m'
        })

        return {
            message: "User authenticated",
            access_token: token,
            refresh_token: refresh_token,
            id: user.id,
        }
    }

    async Update(id, data) {
        const userAlreadyExists = await prisma.user.findUnique({
            where: {
                id: id
            }
        })

        if (!userAlreadyExists) {
            throw new Error('User not found')
        }

        //Verificação de senha
        if(data.password) {
            if(!data.oldPassword) {
                throw new Error('Old Password is required')
            } else {
                const passMatch = await bcrypt.compare(data.oldPassword, userAlreadyExists.password)

                if (!passMatch) {
                    throw new Error('Invalid Password')
                }

                data.password = await bcrypt.hash(data.password, 8)
            }
        }

        delete data.oldPassword

        const user = await prisma.user.update({
            where: {
                id: id
            },
            data,
        })

        return "User updated successfully"
    }

    async Remove(id) {
        const userAlreadyExists = await prisma.user.findUnique({
            where: {
                id: id
            }
        })

        if (!userAlreadyExists) {
            throw new Error('User not found')
        }

        await prisma.user.delete({
            where: {
                id: id
            }
        })

        return "User removed successfully"
    }

    async Get(id) {
        try {
            const user = await prisma.user.findUnique({
                where: {
                    id: id
                }
            })

            if (!user) {
                throw new Error('User not found')
            }

            return user
        } catch (error) {
            throw new Error(error)
        }
    }

    async GetAll() {
        try {
            const users = await prisma.user.findMany()

            return users
        } catch (error) {
            throw new Error(error)
        }
    }
}

module.exports = {
    User,
}