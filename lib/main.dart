import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginScreen(), 
  ));
}

// ---------------- شاشة تسجيل الدخول ----------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    if (usernameController.text == 'mohab' && passwordController.text == '1234') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CashierScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('اسم المستخدم أو كلمة المرور غلط يا بطل!', style: TextStyle(fontSize: 16)),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 15, offset: Offset(0, 5))],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                    'https://gpsarab.com/shop11/themes/gpsarab/img/recipes/277.jpg',
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.deepOrange,
                      child: Icon(Icons.lock_person, size: 45, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Mohab Restaurant', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const Text('تسجيل الدخول للكاشير', style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 30),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    labelText: 'اسم المستخدم',
                    prefixIcon: const Icon(Icons.person, color: Colors.deepOrange),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'كلمة المرور',
                    prefixIcon: const Icon(Icons.lock, color: Colors.deepOrange),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.deepOrange, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 3,
                    ),
                    onPressed: login,
                    child: const Text('دخول', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------- شاشة الكاشير ----------------
class CashierScreen extends StatefulWidget {
  const CashierScreen({super.key});

  @override
  State<CashierScreen> createState() => _CashierScreenState();
}

class _CashierScreenState extends State<CashierScreen> {
  final List<String> categories = ['الكشري', 'طواجن', 'الحلو', 'مشروبات', 'الصاله'];
  String selectedCategory = 'الكشري';

  final List<Map<String, dynamic>> allItems = [
    {'name': 'ميني كشري', 'price': 20.0, 'category': 'الكشري'},
    {'name': 'علبه كشري صغير', 'price': 35.0, 'category': 'الكشري'},
    {'name': 'علبه كشري وسط', 'price': 50.0, 'category': 'الكشري'},
    {'name': 'علبه كشري كبير', 'price': 65.0, 'category': 'الكشري'},
    {'name': 'علبه كشري عائلي', 'price': 80.0, 'category': 'الكشري'},
    
    {'name': 'طاجن لحمه', 'price': 50.0, 'category': 'طواجن'},
    {'name': 'طاجن فراخ', 'price': 60.0, 'category': 'طواجن'},
    {'name': 'طاجن كبدة', 'price': 55.0, 'category': 'طواجن'},
    {'name': 'طاجن جبن', 'price': 60.0, 'category': 'طواجن'},
    {'name': 'طاجن مشروم', 'price': 50.0, 'category': 'طواجن'},

    {'name': 'أرز بلبن صغير', 'price': 20.0, 'category': 'الحلو'},
    {'name': 'ارز بلبن كبير', 'price': 30.0, 'category': 'الحلو'},
    {'name': 'مهلبيه', 'price': 25.0, 'category': 'الحلو'},
    {'name': 'كريم كراميل', 'price': 30.0, 'category': 'الحلو'},
    {'name': 'ارز بلبن فرن', 'price': 30.0, 'category': 'الحلو'},
    {'name': 'جيلي ساده', 'price': 20.0, 'category': 'الحلو'},
    {'name': 'جيلي مهلبيه', 'price': 30.0, 'category': 'الحلو'},
    {'name': 'أم علي', 'price': 40.0, 'category': 'الحلو'},

    {'name': 'كانز سفن', 'price': 25.0, 'category': 'مشروبات'},
    {'name': 'كانز بيبسي', 'price': 25.0, 'category': 'مشروبات'},
    {'name': 'كانز شويبس برتقال', 'price': 25.0, 'category': 'مشروبات'},
    {'name': 'مشروب استنج', 'price': 20.0, 'category': 'مشروبات'},
    {'name': 'مياه صغيره', 'price': 10.0, 'category': 'مشروبات'},
    {'name': 'مياه كبيره', 'price': 15.0, 'category': 'مشروبات'},

    {'name': 'طبق صغير', 'price': 35.0, 'category': 'الصاله'},
    {'name': 'طبق وسط', 'price': 40.0, 'category': 'الصاله'},
    {'name': 'طبق كبير', 'price': 50.0, 'category': 'الصاله'},
  ];

  List<Map<String, dynamic>> currentOrder = [];

  void addToOrder(Map<String, dynamic> item) {
    setState(() {
      currentOrder.add(item);
    });
  }

  double get totalAmount {
    return currentOrder.fold(0, (sum, item) => sum + item['price']);
  }

  Color _getItemColor(String category) {
    switch (category) {
      case 'الكشري': return Colors.yellow.shade100;
      case 'طواجن': return Colors.orange.shade100;
      case 'الحلو': return Colors.pink.shade100;
      case 'مشروبات': return Colors.cyan.shade100;
      case 'الصاله': return Colors.purple.shade100;
      default: return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    var displayedItems = allItems.where((item) => item['category'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                'https://gpsarab.com/shop11/themes/gpsarab/img/recipes/277.jpg',
                height: 35,
                width: 35,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(Icons.restaurant_menu, color: Colors.deepOrange, size: 20),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const Text('Mohab Restaurant Cashier', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          ],
        ),
        backgroundColor: Colors.deepOrange, 
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: NetworkImage('https://gpsarab.com/shop11/themes/gpsarab/img/recipes/277.jpg'),
            fit: BoxFit.contain,
            opacity: 0.05, 
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: selectedCategory == categories[index] 
                            ? Colors.deepOrange 
                            : Colors.grey[200],
                        foregroundColor: selectedCategory == categories[index] 
                            ? Colors.white 
                            : Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: selectedCategory == categories[index] ? 5 : 2,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedCategory = categories[index];
                        });
                      },
                      child: Text(categories[index], style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(15),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  childAspectRatio: 1.3, 
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                ),
                itemCount: displayedItems.length,
                itemBuilder: (context, index) {
                  var item = displayedItems[index];
                  return InkWell(
                    onTap: () => addToOrder(item),
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: _getItemColor(item['category']),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, offset: Offset(4, 4), blurRadius: 5),
                          BoxShadow(color: Colors.white, offset: Offset(-4, -4), blurRadius: 5),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              item['name'], 
                              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black87), 
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text('${item['price']} ج', style: const TextStyle(color: Colors.green, fontSize: 15, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // الجزء اللي تحت اتعدل وبقى فيه زرار الخروج الأصفر
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('العناصر: ${currentOrder.length}', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                          Text('الإجمالي: $totalAmount ج.م', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepOrange)),
                        ],
                      ),
                      ElevatedButton.icon(
                        onPressed: currentOrder.isEmpty ? null : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('جاري طباعة الريسيت...'))
                          );
                          setState(() {
                            currentOrder.clear(); 
                          });
                        },
                        icon: const Icon(Icons.print, color: Colors.white),
                        label: const Text('دفع', style: TextStyle(fontSize: 16, color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 15),
                  // ده زرار الخروج الأصفر الجديد
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginScreen()),
                        );
                      },
                      icon: const Icon(Icons.logout, color: Colors.black87),
                      label: const Text('خروج', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
