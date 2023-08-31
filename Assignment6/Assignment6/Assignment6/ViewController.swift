import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        fetchAndSaveData()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            let filePath = self.getDocumentsDirectory().appendingPathComponent("products.json")
            do {
                let data = try Data(contentsOf: filePath)
                let productList = try JSONDecoder().decode(ProductList.self, from: data)
                self.products = productList.products
                self.tableView.reloadData()
            } catch {
                print("Error reading or parsing local JSON file: \(error)")
            }

        }
        
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let product = products[indexPath.row]
        cell.textLabel?.text = product.title  // Changed from 'name' to 'title'
        cell.detailTextLabel?.text = "$\(product.price)"
        return cell
    }
    
    
    func fetchAndSaveData() {
        if let url = URL(string: "https://dummyjson.com/products") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Download Error: \(error)")
                    return
                }
                do {
                    let filePath = self.getDocumentsDirectory().appendingPathComponent("products.json")
                    try data?.write(to: filePath, options: .atomic)
                    print("File saved at \(filePath)")
                } catch {
                    print("Error saving data: \(error)")
                }
            }
            task.resume()
        }
    }
    struct ProductList: Decodable {
        let products: [Product]
    }

}
