import postgres from 'postgres'

export class db {

    static sql = postgres({
        user: 'admin',
        host: 'localhost',
        database: 'bd',
        password: 'admin',
        port: 5432,
    }) 
        
    public static async queryDebug(query: string):Promise<postgres.RowList<(postgres.Row & Iterable<postgres.Row>)[]>|null> {
        try {
            const dbResult = await this.sql.unsafe(query);
            console.log(dbResult);
            return dbResult;
        } catch (error)
        {
            console.error('Erreur SQL:', error);
            return null;
        }    
    }
    
    public static async query(query: string):Promise<postgres.RowList<(postgres.Row & Iterable<postgres.Row>)[]>> {
        try {
            const dbResult = await this.sql.unsafe(query);
            return dbResult;
        } catch (error)
        {
            throw error;
        }    
    }

    public static async isUp():Promise<boolean> {
        try {
            const dbResult = await this.sql.unsafe("SELECT 1");
        if(dbResult)
        {
            console.log("Connexion BD valide");
            return true;
        }
        throw "nope"
        } catch (error)
        {
            console.log("Aucune connexion BD !")
            return false
        }    
    }

}

