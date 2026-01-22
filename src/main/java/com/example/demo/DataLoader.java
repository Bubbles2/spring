package com.example.demo;

import com.example.demo.entity.Customer;
import com.example.demo.entity.Order;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.repository.OrderRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import java.math.BigDecimal;

@Component
public class DataLoader implements CommandLineRunner {
    
    private final CustomerRepository customerRepository;
    private final OrderRepository orderRepository;
    
    public DataLoader(CustomerRepository customerRepository, OrderRepository orderRepository) {
        this.customerRepository = customerRepository;
        this.orderRepository = orderRepository;
    }
    
    @Override
    public void run(String... args) throws Exception {
        // Check if data already exists
        if (customerRepository.count() > 0) {
            System.out.println("Database already contains data. Skipping sample data creation.");
            return;
        }
        
        System.out.println("Loading sample data...");
        
        // Create Customer 1 with multiple orders
        Customer customer1 = new Customer("Acme Corporation", "123 Main Street, New York, NY 10001");
        
        Order order1 = new Order("ORD-001", 1, "PROD-100", 5, new BigDecimal("29.99"));
        Order order2 = new Order("ORD-001", 2, "PROD-101", 3, new BigDecimal("49.99"));
        Order order3 = new Order("ORD-002", 1, "PROD-102", 10, new BigDecimal("15.50"));
        
        customer1.addOrder(order1);
        customer1.addOrder(order2);
        customer1.addOrder(order3);
        
        customerRepository.save(customer1);
        
        // Create Customer 2 with orders
        Customer customer2 = new Customer("TechStart Inc", "456 Silicon Valley Blvd, San Francisco, CA 94016");
        
        Order order4 = new Order("ORD-003", 1, "PROD-200", 2, new BigDecimal("199.99"));
        Order order5 = new Order("ORD-003", 2, "PROD-201", 1, new BigDecimal("299.99"));
        
        customer2.addOrder(order4);
        customer2.addOrder(order5);
        
        customerRepository.save(customer2);
        
        // Create Customer 3 with a single order
        Customer customer3 = new Customer("Global Traders Ltd", "789 Commerce Road, London, UK");
        
        Order order6 = new Order("ORD-004", 1, "PROD-300", 100, new BigDecimal("5.99"));
        
        customer3.addOrder(order6);
        
        customerRepository.save(customer3);
        
        System.out.println("Sample data loaded successfully!");
        System.out.println("Created " + customerRepository.count() + " customers");
        System.out.println("Created " + orderRepository.count() + " orders");
        
        // Display the data
        System.out.println("\n=== Customers and their Orders ===");
        customerRepository.findAll().forEach(customer -> {
            System.out.println("\n" + customer);
            customer.getOrders().forEach(order -> {
                System.out.println("  - " + order);
            });
        });
    }
}
