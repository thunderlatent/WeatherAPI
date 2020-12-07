enum BaseURL: String
{
    case redsoURL = "https://us-central1-redso-challenge.cloudfunctions.net"
    case openWeatherURL = "http://api.openweathermap.org/data/2.5/forecast?appid=0139ea2d45e5a7612448c1893539247a&q=Tainan&units=metric&lang=zh_TW"
}
enum EndPoint: String
{
    case redsoEndPoint = "/catalog"
}

enum Parameter
{
    
    enum Key: String
    {
        case team = "team"
        
        case page = "page"
    }
    enum Value: String
    {
        case rangers = "rangers"
        
        case elastic = "elastic"
        
        case dynamo = "dynamo"
        var tag: Int
        {
            switch self {
            case .rangers:
                return 0
            case .elastic:
                return 1
            default:
                return 2
            }
        }
        
    }
}
