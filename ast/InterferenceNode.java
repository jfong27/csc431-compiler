package ast;

import java.util.Objects;
import java.util.Set;

public class InterferenceNode {

   private int edges;
   private String regName;
   private Set<InterferenceNode> neighbors;

   public InterferenceNode(String regName) {
      this.regName = regName;
   }

   public String getName() {
      return regName;
   }

   public int numEdges() {
      return edges;
   }

   public void removeNeighbor(InterferenceNode neighbor) {
      neighbors.remove(neighbor);
      edges -= 1;
   }

   public void addNeighbor(InterferenceNode neighbor) {
      neighbors.add(neighbor);
      edges += 1;
   }

   @Override
   public boolean equals(Object o) {
      if (o == this) { return true; }
      if (!(o instanceof InterferenceNode)) {
         return false;
      }
      return (regName.equals(((InterferenceNode)o).getName()));
   }

   @Override
   public int hashCode() {
      return Objects.hash(regName);
   }
   
}
