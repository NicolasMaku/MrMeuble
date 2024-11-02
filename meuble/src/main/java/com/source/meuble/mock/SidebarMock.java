package com.source.meuble.mock;


import com.source.meuble.utilisateur.UserRole;
import com.source.meuble.webComponent.Menu;
import com.source.meuble.webComponent.Sidebar;

public class SidebarMock {
    public static final Sidebar DEFAULT_SIDEBAR =
        new Sidebar("bx bx-chair", "Mr Meuble")  // logo + nom du projet
            .withLien("/home") // Lien lorsqu'on clique sur le logo
            .addMenu(
                // Menu: Besoin
                new Menu("Besoins")
                    .withIcon("bx bx-briefcase-alt") // icon du menu: a voir sur: boxicons.com -> clique sur icon -> font -> copier la class
                    .withRoles()
                    .addSubmenu(
                        new Menu("Demande de besoin")  // Besoin (menu) -> Demande de Besoin (sous-menu du menu besoin)
                            .withIcon("bx bx-mail-send")
                            .withLien("/besoin/form")
                            .withRoles()
                    )
                    .addSubmenu(
                        new Menu("Validation Besoin") // Besoin -> Validation Besoin
                            .withIcon("bx bx-task")
                            .withLien("/besoin/list")
                            .withRoles(UserRole.DIRECTION, UserRole.DEPT_ACHAT) // Liste des departements qui peuvent voir le menu sur leur sidebar (vide si tout les depts peut acceder)
                    )
            )
            .addMenu(
                //Menu: Achat
                new Menu("Achat")
                    .withIcon("bx bx-cart-alt")
                    .withLien("/test/layout")
                    .withRoles()
                    .addSubmenu(
                        new Menu("Proformat")
                            .withIcon("bx bx-receipt")
                            .withLien("")
                            .withRoles()
                            .addSubmenu(
                                new Menu("Demande Proformat")
                                    .withIcon("bx bx-plus")
                                    .withLien("/proformat/form")
                            )
                            .addSubmenu(
                                new Menu("Validation Proformat")
                                    .withIcon("bx bx-task")
                                    .withLien("/proformat/list")
                            )
                    )
                    .addSubmenu(
                        new Menu("Bon de Commande")
                            .withIcon("bx bx-receipt")
                            .withLien("")
                            .withRoles()
                            .addSubmenu(
                                new Menu("Validation")
                                    .withIcon("bx bx-task")
                                    .withLien("/bon-commande/validation")
                                    .withRoles(UserRole.DIRECTION, UserRole.DEPT_FINANCE)
                            )
                            .addSubmenu(
                                new Menu("Liste")
                                    .withLien("/bon-commande/list")
                                    .withIcon("bx bx-list-ol")
                            )
                    )
                    .addSubmenu(
                        new Menu("Bon de Reception")
                            .withIcon("bx bx-receipt")
                            .withLien("/bon-reception/list")
                            .withRoles()
                    )
                    .addSubmenu(
                        new Menu("Facture Achat")
                            .withIcon("bx bx-file-blank")
                            .withLien("/facture/list")
                    )
            )
            .addMenu(
                new Menu("Stock")
                    .withIcon("bx bx-cube")
                    .addSubmenu(
                        new Menu("Mouvement de Stock")
                            .withIcon("bx bx-transfer")
                            .withLien("/mouvement-stock/list")
                    )
                    .addSubmenu(
                        new Menu("Etat de Stock")
                            .withIcon("bx bx-stats")
                            .withLien("/etat-stock/list")
                    )
            )
            .addMenu(
                new Menu("Produits")
                    .withIcon("bx bx-box")
                    .addSubmenu(
                        new Menu("Saisie Produit")
                    )
                    .addSubmenu(
                        new Menu("Saisie Recette")
                    )
                    .addSubmenu(
                        new Menu("Fabrication")
                    )
            );
}
