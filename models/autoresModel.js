module.exports = (sequelize, DataTypes) => {
    const autores = sequelize.define('autores', {
        autor_id: {
            type: DataTypes.INTEGER,
            primaryKey: true,
            autoIncrement: true
        },
        nome: {
            type: DataTypes.STRING,
            allowNull: false
        }, 
        nacionalidade: {
            type: DataTypes.STRING,
            allowNull: false
        },
        biografia: {
            type: DataTypes.STRING,
            allowNull: false
        }
    }, 
    {
        createdAt: false, 
        updatedAt: false,
        timestamps: false
    }
);
    return autores;
};
