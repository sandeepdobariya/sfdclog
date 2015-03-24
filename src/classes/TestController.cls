public with sharing class TestController {
    public TestController() {
        this.values = new ExportValue[] {
            new ExportValue('1', 'Name 1'), new ExportValue('2', 'Name 2')
        };
    }

    public ExportValue[] getExportValues() {
        return values;
    }

    public class ExportValue {
        public ExportValue(String id, String name) {
            this.id = id;
            this.name = name;
        }
        
        public String id { get; private set; }
        public String name { get; private set; }        
    }
    
    private final ExportValue[] values;
}